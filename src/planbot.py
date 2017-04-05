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
    print('Module for querying user terms')

# load spaCy glove vector models
nlp = spacy.load('en_vectors_glove_md')


def open_sesame(file):
    with open('json/' + file) as js:
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
    # Return match with least distance if above 0.8 threshold
    def ratio_gen():
        for key in keys:
            yield key, Levenshtein.ratio(phrase, key)

    entity = max(ratio_gen(), key=itemgetter(1))

    return list(entity[0]) if entity[1] > 0.8 else None


def glossary(phrase):
    phrase = phrase.lower()
    glossary = open_sesame('glossary.json')
    definition = options = matches = None

    # account for quickreplies longer than 20 characters
    phrase = phrase.replace('...', '') if phrase.endswith('...') else phrase

    def format_def(term):
        return '{}: {}'.format(term.title(), glossary[term])

    try:
        definition = format_def(phrase)
    except KeyError:
        if len(phrase) >= 3:
            # catch acronyms if only match
            match = [key for key in glossary if phrase in key]
            if len(match) == 1:
                definition = format_def(match[0])

    if not definition and len(phrase) >= 3:
        matches = sentiment(phrase, glossary)
        if matches:
            matches = [m.title() for m in matches]
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
    phrase = phrase.lower()
    pydict = open_sesame(filename)
    title = link = options = matches = None

    for key in pydict:
        if phrase in key:
            title = key.title()
            link = pydict[key]

    if not link:
        matches = sentiment(phrase, pydict)
        if matches:
            matches = [m.title() for m in matches]
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
        council = phrase.lower()

    if council and not plans.get(council):
        council = council.lower()
        for word in ['borough', 'council', 'district', 'london']:
            council = council.replace(word, '')
        match = spell_check(council, plans)
        council = match[0] if match else None

    try:
        return plans[council], '{} Local Plan'.format(council.title())
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
