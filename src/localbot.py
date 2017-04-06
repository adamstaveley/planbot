#! python3
# Command line Planbot client

import os
import json
import planbotsimple as pb
from wit import Wit

access_token = os.environ.get('WIT_TOKEN')


def send(request, response):
    text = response['text'].decode('UTF-8')
    if not response['quickreplies']:
        response['quickreplies'] = request['context'].get('quickreplies')
    qr = response['quickreplies']

    if qr:
        print('{}\nQR: {}'.format(text, ', '.join(qr)))
    elif isinstance(text, list):
        print('\n'.join(text))
    else:
        print(text)


def first_entity_value(entities, entity):
    if entity not in entities:
        return None
    val = entities[entity][0]['value']
    if not val:
        return None
    return val['value'] if isinstance(val, dict) else val


def search_glossary(request):
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        definition, options = pb.glossary(phrase)
        if definition:
            context['definition'] = definition
        elif options:
            context['options'] = options
            context['quickreplies'] = options + ['Go back']
        else:
            context['missing_def'] = True
    else:
        context['mssing_def'] = True

    return context


def search_classes(request):
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        context['info'] = pb.use_classes(phrase)
    else:
        context['missing_use'] = True

    return context


def search_projects(request):
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        link, options = pb.get_link(phrase, 'development.json')[1:]
        if link:
            context['link'] = link
        elif options:
            context['options'] = options
            context['quickreplies'] = options + ['Go back']
        else:
            context['missing_link'] = True
    else:
        context['missing_link'] = True

    return context


def search_docs(request):
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        link, options = pb.get_link(phrase, 'legislation.json')[1:]
        if link:
            context['link'] = link
        elif options:
            context['options'] = options
            context['quickreplies'] = options + ['Go back']
        else:
            context['missing_link'] = True
    else:
        context['missing_link'] = True

    return context


def search_plans(request):
    context = request['context']
    entities = request['entities']

    location = first_entity_value(entities, 'term')
    if council:
        lp = pbs.local_plan(council)[0]
        if lp:
            context['local_plan'] = lp
        else:
            context['missing_loc'] = True
    else:
        context['missing_loc'] = True

    return context


def search_locations(request):
    context = request['context']

    with open('json/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    context['quickreplies'] = list(reports) + ['Go back']

    return context


def search_sectors(request):
    context = request['context']
    entities = request['entities']

    # Should work - if not use a global variable
    global user_loc
    user_loc = first_entity_value(entities, 'report_location')

    with open('data/json/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    try:
        context['quickreplies'] = list(reports[user_loc]) + ['Change']
    except KeyError:
        context['quickreplies'] = ['Change']

    return context


def search_reports(request):
    context = request['context']
    entities = request['entities']

    global user_loc
    sector = first_entity_value(entities, 'report_sector')
    if sector:
        context['reports'] = pbs.reports(user_loc, sector)[1]
    else:
        context['missing_report'] = True

    return context


actions = {
    'send': send,
    'get_definition': search_glossary,
    'get_class': search_classes,
    'get_pdinfo': search_projects,
    'get_doc': search_docs,
    'get_lp': search_legislation,
    'get_locations': search_locations,
    'get_sectors': search_sectors,
    'get_reports': search_reports
}

client = Wit(access_token, actions=actions)
client.interactive()
