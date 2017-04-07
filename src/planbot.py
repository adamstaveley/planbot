#! python3
# Planbot module

import json
import re
import requests
import spacy
import Levenshtein
from collections import OrderedDict
from operator import itemgetter

if __name__ == "__main__":
    print('Planbot module for querying user terms with NLP')

# load spaCy glove vector models
nlp = spacy.load('en_vectors_glove_md')


def open_sesame(file):
    with open('data/' + file) as js:
        pydict = json.load(js)

    return pydict


def sentiment(phrase, keys):
    # Return top 3 matches over 0.5 threshold using spaCy NLP
    def ratio_gen():
        for key in keys:
            yield key, nlp(phrase).similarity(nlp(key))

    entities = {key: ratio for key, ratio in ratio_gen() if ratio > 0.5}
    entities = sorted(entities, key=entities.get, reverse=True)[:3]

    return spell_check(phrase, keys) if not entities else entities


def spell_check(phrase, keys):
    # Return match with least distance if above 0.7 threshold
    # Fixed threshold may present issues with shorter strings
    def ratio_gen():
        for key in keys:
            yield key, Levenshtein.ratio(phrase, key)

    entity = max(ratio_gen(), key=itemgetter(1))

    return [entity[0]] if entity[1] > 0.75 else None


def titlecase(phrase):
    phrase = phrase.capitalize()
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


def glossary(phrase):
    glossary = open_sesame('glossary.json')
    definition = options = None

    # catch accidental triggers and process phrase
    if len(phrase) < 3:
        return None
    else:
        phrase = phrase.replace('...', '').lower()

    def process(term):
        return '{}: {}'.format(titlecase(term), glossary[term])

    try:
        definition = process(phrase)
    except KeyError:
        # use only match as definition, multi-match as options
        # else find sentiment in phrase
        options = [key for key in glossary if phrase in key]
        if len(options) == 1:
            definition = process(options[0])
            options = None
        elif not options:
            options = [titlecase(key) for key in sentiment(phrase, glossary))
    finally:
        return definition, options


def use_classes(phrase):
    classes = open_sesame('use_classes.json')
    use = None

    def process(key):
        return '{}: {}'.format(key, classes[key])

    try:
        match = [use for use in classes if phrase in use][0]
        use = process(match)
    except:
        if 'list' in phrase:
            use = '\n'.join(sorted(classes))
        else:
            match = spell_check(phrase, classes)
            use = process(match[0])
    finally:
        return use


def get_link(phrase, filename):
    phrase = phrase.replace('...', '').lower()
    pydict = open_sesame(filename)
    link = title = options = None
    link = (title, link)

    options = [key for key in pydict if phrase in key]
    if len(options) == 1:
        link = (titlecase(options[0]), pydict[options[0]])
        options = None
    else:
        options = [titlecase(key) for key in sentiment(phrase, pydict)]

    return link, options


def find_lpa(postcode):
    # convert UK postcode to LPA using the postcodes.io API
    res = requests.get('https://api.postcodes.io/postcodes/' + postcode)
    data = res.json()

    try:
        return data['result']['admin_district'].lower()
    except:
        KeyError


def local_plan(phrase):
    plans = open_sesame('local_plans.json')

    if re.compile(r'[A-Z]+\d+[A-Z]?\s?\d[A-Z]+', re.I).search(phrase):
        council = find_lpa(phrase)
    else:
        council = phrase.lower()

    if council and not plans.get(council):
        for word in ['borough', 'council', 'district', 'london']:
            council = council.replace(word, '')
        match = spell_check(council, plans)
        council = match[0] if match else None

    try:
        return plans[council], '{} Local Plan'.format(titlecase(council))
    except:
        KeyError
    else:
        title = '{} Local Plan'.format(titlecase(council))
        return title, plans[council]


def reports(loc, sec):
    # rather than joining reports and intercepting text starting with 'http'
    # down the line, better to assign True to a template variable
    with open('data/reports.json') as js:
        docs = json.load(js, object_pairs_hook=OrderedDict)

    titles = reports = None

    try:
        titles = list(docs[loc][sec])
        reports = list(docs[loc][sec].values())
    except:
        KeyError
    else:
        return titles, ' '.join(reports)
