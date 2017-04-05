#! python3
# Planbot module

import json
import re
import requests
import Levenshtein
from collections import OrderedDict
from operator import itemgetter

if __name__ == "__main__":
    print('Module for querying user terms')


def open_sesame(file):
    with open('json/' + file) as js:
        pydict = json.load(js)

    return pydict


def distance_match(phrase, keys):
    # Return  top 3 matches with least distance above 0.5 threshold
    def ratio_gen():
        for key in keys:
            yield key, Levenshtein.ratio(phrase, key)

    entities = {key: ratio for key, ratio in ratio_gen() if ratio > 0.5}
    entities = sorted(entities, key=entities.get, reverse=True)[:3]

    return entities if not entities else None


def spell_check(phrase, keys):
    # Return match with least distance if above 0.8 threshold
    def ratio_gen():
        for key in keys:
            yield key, Levenshtein.ratio(phrase, key)

    entity = max(ratio_gen(), key=itemgetter(1))

    return list(entity[0]) if entity[1] > 0.8 else None


def glossary(phrase):
    glossary = open_sesame('glossary.json')
    definition = options = matches = None

    phrase = phrase.replace('...', '') if phrase.endswith('...') else phrase

    def format_def(term):
        return '{}: {}'.format(term, glossary[term])

    try:
        definition = format_def(phrase)
    except KeyError:
        if len(phrase) >= 3:
            match = [k for k in glossary if phrase in k]
            if len(match) == 1:
                definition format_def(match)

    if not definition and len(phrase) >= 3:
        matches = distance_match(phrase, glossary)
        if matches:
            options = '\n\u2022 {}'.format('\n\u2022 '.join(matches))

    return definition, options, matches


def use_classes(phrase):
    classes = open_sesame('use_classes.json')

    for use in classes:
        if phrase in use:
            return '{}: {}'.format(use, classes[use])

    if 'Full list' in phrase:
        return '\n'.join(sorted(classes))


def get_link(phrase, filename):
    pydict = open_sesame(filename)
    title = link = options = matches = None

    for key in pydict:
        if phrase in key:
            title = key
            link = pydict[key]

    if not link:
        matches = distance_match(phrase, pydict)
        if matches:
            options = '\n\u2022 {}'.format('\n\u2022 '.join(matches))

    return title, link, options, matches


def find_lpa(postcode):
    # convert UK postcode to LPA using the postcodes.io API
    res = requests.get('https://api.postcodes.io/postcodes/' + postcode).json()

    try:
        return res['result']['admin_district']
    except:
        KeyError


def local_plan(phrase):
    plans = open_sesame('local_plans.json')

    if re.compile(r'[A-Z]+\d+[A-Z]?\s?\d[A-Z]+', re.I).search(phrase):
        council = find_lpa(phrase)
    else:
        council = phrase.title()

    if council and not plans.get(council):
        for word in ['Borough', 'Council', 'District', 'London']:
            council = council.replace(word, '')
        council.strip()
        match = spell_check(council, plans)
        council = match[0] if match else None

    try:
        return plans[council], '{} Local Plan'.format(council)
    except:
        KeyError


def reports(loc, sec):
    with open('json/reports.json') as js:
        docs = json.load(js, object_pairs_hook=OrderedDict)

    titles = reports = None

    try:
        titles = list(docs[loc][sec])
        reports = list(docs[loc][sec].values())
    except:
        KeyError

    return titles, ' '.join(reports)
