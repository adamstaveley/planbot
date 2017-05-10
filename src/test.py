#! python3
# Planbot module

from collections import OrderedDict
from operator import itemgetter
import logging
import json
import re
import requests
import Levenshtein

# setup logging
logging.basicConfig(level=logging.INFO)
logging.getLogger("requests").setLevel(logging.WARNING)


def open_sesame(filename):
    with open('data/' + filename) as js:
        pydict = json.load(js)

    return pydict


def distance_match(phrase, keys):
    # Return  top 3 matches with least distance above 0.5 threshold
    def ratio_gen():
        for key in keys:
            yield key, Levenshtein.ratio(phrase, key)

    entities = {key: ratio for key, ratio in ratio_gen() if ratio > 0.5}
    entities = sorted(entities, key=entities.get, reverse=True)[:3]

    return entities


def spell_check(phrase, keys):
    # Return match with least distance if above 0.7 threshold
    # Fixed threshold may present issues with shorter strings
    def ratio_gen():
        for key in keys:
            yield key, Levenshtein.ratio(phrase, key)

    entity = max(ratio_gen(), key=itemgetter(1))

    return [entity[0]] if entity[1] > 0.75 else None


def titlecase(phrase):
    if phrase == 'uk':
        return phrase.upper()

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



def definitions(phrase):
    glossary = open_sesame('glossary.json')
    definition = options = None

    # catch accidental triggers and process phrase
    if len(phrase) < 3:
        return definition, options
    else:
        phrase = phrase.replace('...', '').lower()

    def process(term):
        return '{}: {}'.format(titlecase(term), glossary[term])

    try:
        definition = (titlecase(phrase), glossary[phrase])
    except Exception as err:
        # use only match as definition, multi-match as options
        # else find nearest key
        logging.info('definitions exception: {}'.format(err))
        options = [key for key in glossary if phrase in key]
        if len(options) == 1:
            definition = (titlecase(options[0]), glossary[options[0]])
            options = None
        elif not options:
            options = [titlecase(k) for k in distance_match(phrase, glossary)]
    finally:
        return definition, options



def use_classes(phrase):
    phrase = phrase.lower()
    classes = open_sesame('use_classes.json')
    use = None

    def process(key):
        return '{}: {}'.format(key, classes[key])

    try:
        match = [use for use in classes if phrase in use][0]
        use = (titlecase(match), classes[match])
    except Exception as err:
        logging.info('use_classes exception: {}'.format(err))
        if 'list' in phrase:
            use = '\n'.join(sorted(classes))
        else:
            match = spell_check(phrase, classes)
            use = (titlecase(match[0]), classes[match[0]])
    finally:
        return use



def get_link(phrase, filename):
    phrase = phrase.replace('...', '').lower()
    pydict = open_sesame(filename)
    link = (None, None)

    options = [key for key in pydict if phrase in key]
    if len(options) == 1:
        link = (titlecase(options[0]), pydict[options[0]])
        options = None
    elif not options:
        options = [titlecase(key) for key in distance_match(phrase, pydict)]

    return link, options



def find_lpa(postcode):
    # convert UK postcode to LPA using the postcodes.io API
    res = requests.get('https://api.postcodes.io/postcodes/' + postcode)
    data = res.json()

    try:
        return data['result']['admin_district'].lower()
    except KeyError:
        return None



def local_plan(phrase):
    plans = open_sesame('local_plans.json')
    title = link = None

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

        for word in ['borough', 'council', 'district', 'london']:
            council = council.replace(word, '')

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
        title = '{} Local Plan'.format(titlecase(council))
        options = None
    finally:
        return (title, link), options



def market_reports(loc, sec):
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

