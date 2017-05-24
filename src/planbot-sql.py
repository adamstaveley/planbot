#!/usr/bin/python3
'''
planbot is a Celery worker program which enables multiple programs to use the
semantic analysis provided by spaCy without the need for a full module import.

Messages are sent via the rabbitmq broker. API calls have access to additional
delay, ready and get methods for handling asynchronous calls. If these methods
are not used spaCy will fail to find semantic matches as its models will not
be loaded on a traditional module import.

All Celery tasks except use_classes and market_reports return a tuple
consisting of a request's result and possible options. The use_classes and
market_report functions return only the result.
'''

from collections import OrderedDict
from operator import itemgetter
import logging
import sqlite3
import json
import re
import requests
import spacy
import Levenshtein
from celery import Celery

# setup celery
app = Celery('planbot',
             broker='redis://',
             backend='redis://')

app.conf.update(result_expires=60,
                worker_max_tasks_per_child=5)

# setup logging
logging.basicConfig(level=logging.INFO)
logging.getLogger("requests").setLevel(logging.WARNING)


class DB_Query():

    # initialise table to query - sanitised against tables list

    tables = ['glossary', 'use_classes', 'projects', 'documents',
              'local_plans', 'market_reports']

    def __init__(self, table):
        self.conn = sqlite3.connect('data/data/db')
        self.cursor = .cursor()
        if table not in self.tables:
            raise InvalidTableError('Not a valid table: {}'.format(table))
        else:
            self.table = table

    def query_all(self, field):
        query = "SELECT {} FROM {}".format(', '.join(field), self.table)
        res = self.cursor.execute(query)
        return [k[0] for k in res.fetchall()]

    def query_spec(self, spec, phrase):
        if spec == 'EQL':
            query = '''SELECT * FROM {}
                       WHERE term = '{}' '''.format(self.table, phrase)

        elif spec == 'LIKE':
            query = '''SELECT term FROM {}
                       WHERE term LIKE '%{}%' '''.format(self.table, phrase)

        res = self.cursor.execute(query)
        return (res.fetchall(), res.fetchone())[spec == 'EQL']

    def close():
        self.conn.close()


def sem_analysis(phrase, keys):
    '''Return top 3 semantic matches over 0.5 threshold using spaCy NLP.'''

    def ratio_gen():
        for key in keys:
            yield key, nlp(phrase).similarity(nlp(key))

    entities = {key: ratio for key, ratio in ratio_gen() if ratio > 0.5}
    entities = sorted(entities, key=entities.get, reverse=True)[:3]

    return spell_check(phrase, keys) if not entities else entities


def spell_check(phrase, keys):
    '''Return match with least distance if above 0.7 threshold.'''

    def ratio_gen():
        for key in keys:
            yield key, Levenshtein.ratio(phrase, key)

    entity = max(ratio_gen(), key=itemgetter(1))

    return [entity[0]] if entity[1] > 0.75 else []


def titlecase(phrase):
    '''Turn lowercase JSON keys into titles.'''

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


def ready(phrase):
    return phrase.replace('...', '').lower()


@app.task
def definitions(phrase):
    '''Celery task to handle definition request.'''

    glossary = DB_Query('glossary')
    definition = options = None

    # catch accidental triggers and process phrase
    if len(phrase) < 3:
        return None
    else:
        phrase = ready(phrase)

    def get(query):
        return glossary.query_spec('EQL', query)

    res = get(phrase)
    if res:
        definition = (titlecase(string) for string in res)
    else:
        options = [val[0] for val in glossary.query_spec('LIKE', phrase)]
        if len(options) == 1:
            definition = (titlecase(val) for val in get(options[0]))
            options = None
        elif not options:
            all_data = glossary.query_all('term')
            options = [titlecase(k) for k in sem_analysis(phrase, all_data)]

    return definition, options


@app.task
def use_classes(phrase):
    '''Celery task to handle use class request.'''

    phrase = phrase.lower()
    classes = open_sesame('use_classes.json')
    use = None

    try:
        match = [use for use in classes if phrase in use][0]
        use = (titlecase(match), classes[match])
    except Exception as err:
        logging.info('use_classes exception: {}'.format(err))
        if 'list' in phrase:
            use = [titlecase(k) for k in classes]
        else:
            match = spell_check(phrase, classes)
            if match:
                use = (titlecase(match[0]), classes[match[0]])
    finally:
        return use


@app.task
def get_link(phrase, filename):
    '''Celery task to handle project/doc request.'''

    phrase = phrase.replace('...', '').lower()
    pydict = open_sesame(filename)
    link = (None, None)

    options = [key for key in pydict if phrase in key]
    if len(options) == 1:
        link = (titlecase(options[0]), pydict[options[0]])
        options = None
    elif not options:
        options = [titlecase(k) for k in sem_analysis(phrase, pydict)]

    return link, options


def find_lpa(postcode):
    '''Use postcodes.io API to convert postcode to LPA.'''

    res = requests.get('https://api.postcodes.io/postcodes/' + postcode)
    data = res.json()

    try:
        return data['result']['admin_district'].lower()
    except KeyError:
        return None


@app.task
def local_plan(phrase):
    '''Celery task to handle local plan request.'''

    plans = open_sesame('local_plans.json')
    title = link = None

    # regex match postcodes
    if re.compile(r'[A-Z]+\d+[A-Z]?\s?\d[A-Z]+', re.I).search(phrase):
        council = find_lpa(phrase)
        if not council:
            return (title, link), None
    else:
        council = phrase.lower()

    def format_title(title):
        return '{} Local Plan'.format(titlecase(title))

    try:
        link = plans[council]
    except Exception as err:
        logging.info('local_plan exception: {}'.format(err))

        # remove unnecessary words
        for word in ['borough', 'council', 'district', 'london']:
            council = council.replace(word, '')

        # use single option as council, run spell check if no matches
        options = [key for key in plans if council in key]
        if len(options) == 1:
            title = format_title(titlecase(options[0]))
            link = plans[options[0]]
            options = None
        elif not options:
            council = spell_check(council, plans)
            if council:
                title = format_title(titlecase(council[0]))
                link = plans[council[0]]
        else:
            options = [titlecase(key) for key in options]
    else:
        title = format_title(titlecase(council))
        options = None
    finally:
        return (title, link), options


@app.task
def market_reports(loc, sec):
    '''Celery task to handle report request.'''

    loc, sec = loc.lower(), sec.lower()

    with open('data/reports.json') as js:
        docs = json.load(js, object_pairs_hook=OrderedDict)

    try:
        titles = list(docs[loc][sec])
        links = list(docs[loc][sec].values())
    except Exception as err:
        logging.info('market_reports exception: {}'.format(err))
        titles = reports = None
    finally:
        return titles, links


__all__ = [
    'titlecase',
    'definitions',
    'use_classes',
    'get_link',
    'local_plan',
    'market_reports']


if __name__ == '__main__':
    # instantiate spacy and celery
    nlp = spacy.load('en_vectors_glove_md')
    app.start()
