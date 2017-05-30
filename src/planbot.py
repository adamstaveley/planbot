from operator import itemgetter
import logging
import re

import spacy
import Levenshtein
import requests
from celery import Celery, Task

from connectdb import ConnectDB

# setup celery
app = Celery('planbot',
             broker='redis://',
             backend='redis://')

app.conf.update(result_expires=60,
                worker_max_tasks_per_child=5)

# setup logging
logging.basicConfig(level=logging.INFO)
logging.getLogger("requests").setLevel(logging.WARNING)


def titlecase(phrase):
    if phrase == 'uk':
        return phrase.upper()

    phrase = phrase.capitalize()

    # don't capitalise certain words
    with open('data/uncap.txt') as f:
        uncap = [line.replace('\n', '') for line in f]

    for word in phrase.split()[1:]:
        if word not in uncap:
            phrase = phrase.replace(word, word.capitalize())

    # uppercase acronyms and lowercase longer text in parentheses
    for acr in re.compile(r'\(\w{1,5}\)').findall(phrase):
        phrase = phrase.replace(acr, acr.upper())
    for paren in re.compile(r'\([\w\s]{6,}\)').findall(phrase):
        phrase = phrase.replace(paren, paren.lower())

    return phrase


class Planbot(Task):

    switch = {
        'definitions': self.get_direct,
        'use_classes': self.get_use_class,
        'projects': self.get_options,
        'documents': self.get_options,
        'local_plans': self.get_local_plan,
        'reports': self.get_reports}

    def __init__(self, action, query, sector=None):
        self.action, self.query = action, self.ready(query)
        self.sector = self.ready(sector) if sector else sector
        self.result = self.options = None
        self.db = ConnectDB(action)
        self.switch[action]()
        self.db.close()

    def get_direct():
        res = self.db.query_spec(self.query, spec='EQL')
        if res:
            self.result = self.process(res)
        else:
            if self.action == 'local_plans':
                for word in ['borough', 'council', 'district', 'london']:
                    self.query = self.query.replace(word, '')
            self.run_options()
        return None

    def get_options():
        res = [k[0] for k in self.db.query_spec(self.query, spec='LIKE')]
        if len(res) == 1:
            res = self.db.query_spec(options[0], spec='EQL')
            self.result = self.process(res)
        elif not res:
            keys = db_object.query_keys()
            res = self.semantic_analysis(keys)
            self.options = [titlecase(k) for k in res]
        else:
            self.options = [titlecase(k) for k in res]
        return None

    def get_use_class():
        if 'list' in phrase:
            keys = self.db.query_keys()
            self.result = sorted([titlecase(key) for key in keys])
        else:
            self.run_options()
            return None

    def get_local_plan():
        def find_lpa(postcode):
            api = 'https://api.postcodes.io/postcodes/'
            res = requests.get(url + postcode).json()
            if res.get('result'):
                return data['result']['admin_district'].lower()

        if re.compile(r'[A-Z]+\d+[A-Z]?\s?\d[A-Z]+', re.I).search(self.query):
            council = find_lpa(self.query)
            if not council:
                logging.info('No council found for {}'.format(phrase))
            else:
                self.query = council

        self.get_direct()
        return None

    def get_reports():
        res = reports.query_reports(loc=self.query, sec=self.sector)
        if res:
            titles = [r[0] for r in res]
            links = [r[1] for r in res]
            self.result = (titles, links)
        return None

    def sem_analysis(keys):
        def ratio_gen():
            for key in keys:
                yield key, nlp(self.query).similarity(nlp(key))

        entities = {key: ratio for key, ratio in ratio_gen() if ratio > 0.5}
        entities = sorted(entities, key=entities.get, reverse=True)[:3]

        return self.spell_check(keys) if not entities else entities

    def spell_check(keys):
        def ratio_gen():
            for key in keys:
                yield key, Levenshtein.ratio(self.query, key)

        entity = max(ratio_gen(), key=itemgetter(1))

        return [entity[0]] if entity[1] > 0.75 else []

    def ready(phrase):
        return phrase.replace('...', '').lower()

    def process(result):
        return titlecase(result[0]), result[1]


if __name__ == '__main__':
    nlp = spacy.load('en_vectors_glove_md')
    app.run()
