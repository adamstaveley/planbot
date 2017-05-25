#!/usr/bin/python3
'''
planbot is a Celery worker program which enables multiple programs to use the
semantic analysis provided by spaCy without the need for a full module import.

Messages are sent via the redis broker. API calls have access to additional
delay, ready and get methods for handling asynchronous calls. If these methods
are not used spaCy will fail to find semantic matches as its models are not
loaded on a traditional module import.

Each celery task takes a phrase (and in the case of get_links a table string)
and returns a result and options field.
'''

from operator import itemgetter
import logging
import json
import re
import spacy
import Levenshtein
import requests
import psycopg2
from psycopg2.sql import SQL, Identifier
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


class ConnectDB():
    '''Connect to the planbot database and access a table.'''

    tables = ['glossary', 'use_classes', 'projects', 'documents',
              'local_plans', 'market_reports']

    def __init__(self, table):
        self.connection = psycopg2.connect('dbname=planbot')
        self.cursor = self.conn.cursor()
        if table not in self.tables:
            raise Exception('Invalid table: {}'.format(table))
        else:
            self.table = table

    def query_keys(self):
        '''Return all keys from a table.'''

        query = SQL("SELECT key FROM {}".format(Identifier(self.table)))
        res = self.cursor.execute(query)
        return [k[0] for k in res.fetchall()]

    def query_spec(self, phrase, spec=None):
        '''Submit a database lookup. The spec kwarg takes one of 'EQL' or
           'LIKE' for respective lookup types. EQL returns a sole key-value
           whereas LIKE returns multiple keys where the query is found.'''

        assert spec in ['EQL', 'LIKE']
        if spec == 'EQL':
            query = SQL("SELECT * FROM {} WHERE key=%s".format(
                Identifier(self.table)), phrase)

        elif spec == 'LIKE':
            phrase = '%{}%'.format(phrase)
            query = SQL("SELECT key FROM {} WHERE key LIKE %s".format(
                Identifier(self.table)), phrase)

        res = self.cursor.execute(query)
        return res.fetchone() if spec == 'EQL' \
            else res.fetchall() if spec == 'LIKE' \
            else None

    def query_reports(self, loc, sec):
        '''Returns report table query given a location and sector,
           sorted by date.'''

        assert self.table == 'reports'
        return self.cursor.execute('''SELECT title, url FROM reports
                                      WHERE location=%s AND sector=%s
                                      ORDER BY date DESC''', (loc, sec))

    def close(self):
        '''Close connection to database.'''

        self.connection.close()


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
    '''Turn lowercase keys into titles.'''

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
    '''Remove elipses if necessary and convert to lowercase.'''

    return phrase.replace('...', '').lower()


def process(result):
    '''Return tuple of titlecase key and value.'''

    return (titlecase(res[0]), res[1] for res in result)


def run_options(db_object, query):
    '''Run through various stages of processing to find relevant matches.'''

    options = [k[0] for k in db_object.query_spec(query, spec='LIKE')]
    if len(options) == 1:
        result = process(db_object.query_spec(options[0], spec='EQL'))
        options = None
    elif not options:
        all_data = db_object.query_keys()
        options = [titlecase(k) for k in sem_analysis(query, all_data)]
    else:
        options = [titlecase(k) for k in options]

    return result, options


@app.task
def definitions(phrase):
    '''Celery task to handle definition request.'''

    glossary = ConnectDB('glossary')
    definition = options = None

    # catch accidental triggers and process phrase
    phrase = ready(phrase)

    res = glossary.query_spec(phrase, spec='EQL')
    if res:
        definition = process(res)
    else:
        definition, options = run_options(glossary, phrase)

    glossary.close()
    return definition, options


@app.task
def use_classes(phrase):
    '''Celery task to handle use class request.'''

    phrase = phrase.lower()
    classes = ConnectDB('use_classes')
    use = options = None

    if 'list' in phrase:
        return classes.query_keys()

    res = classes.query_spec(phrase, spec='LIKE')
    if len(res) == 1:
        use = process(classes.query_spec(res[0], spec='EQL'))
    elif not res:
        use, options = run_options(classes, phrase)

    glossary.close()
    return use, options


@app.task
def get_link(phrase, table):
    '''Celery task to handle project/doc request.'''

    phrase = ready(phrase)
    db = ConnectDB(table)
    link = options = None

    options = [k[0] for k in like(db, phrase)]
    if len(options) == 1:
        link = process(db.query_spec(options[0], spec='EQL'))
    elif not options:
        run_options(db, phrase)

    glossary.close()
    return link, options


def find_lpa(postcode):
    '''Use postcodes.io API to convert postcode to LPA.'''

    res = requests.get('https://api.postcodes.io/postcodes/' + postcode)
    data = res.json()

    try:
        return data['result']['admin_district'].lower()
    except Exception as err:
        logging.info('Unable to parse postcodes request: {}'.format(err))


@app.task
def local_plan(phrase):
    '''Celery task to handle local plan request.'''

    plans = ConnectDB('local_plans')
    link = options = None

    # regex match postcodes
    if re.compile(r'[A-Z]+\d+[A-Z]?\s?\d[A-Z]+', re.I).search(phrase):
        council = find_lpa(phrase)
        if not council:
            raise Exception('No council found for {}'.format(phrase))
    else:
        council = phrase.lower()

    res = plans.query_spec(plans, spec='EQL')
    if res:
        link = process(res)
    else:
        for word in ['borough', 'council', 'district', 'london']:
            council = council.replace(word, '')
        link, options = run_options(plans, council)

    plans.close()
    return link, options


@app.task
def market_reports(location, sector):
    '''Celery task to handle report request.'''

    loc, sec = loc.lower(), sec.lower()
    titles = reports = None

    reports = ConnectDB('reports')

    res = reports.query_reports(location, sector)
    if res:
        titles = [t for t in res[0]]
        reports = [r for r in res[1]]

    reports.close()
    return (titles, reports), None


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
