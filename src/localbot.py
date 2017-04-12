#! python3
# Command line Planbot client

import os
import sys
import json
from collections import OrderedDict
from wit import Wit
import planbotsimple as pb

access_token = os.environ.get('WIT_TOKEN')


def send(request, response):
    # bug?: quickreplies persist if bot sends multiple messages in succession
    text = response['text'].decode('UTF-8')
    if not response['quickreplies']:
        response['quickreplies'] = request['context'].get('quickreplies')
    qr = response['quickreplies']

    if qr:
        print('{}\nQRs: {}'.format(text, ', '.join(qr)))
    elif request['context'].get('exit'):
        request.clear()
        response.clear()
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
        definition, options = pb.definitions(phrase)
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
        if not context.get('info'):
            context['missing_use'] = True
    else:
        context['missing_use'] = True

    return context


def search_projects(request):
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        link, options = pb.get_link(phrase, 'development.json')
        if link:
            context['link'] = link[1]
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
        link, options = pb.get_link(phrase, 'legislation.json')
        if link:
            context['link'] = link[1]
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
    if location:
        plan, options = pb.local_plan(location)
        if plan:
            context['local_plan'] = plan[1]
        elif options:
            context['options'] = options
            context['quickreplies'] = options + ['Go back']
        else:
            context['missing_loc'] = True
    else:
        context['missing_loc'] = True

    return context


def search_locations(request):
    context = request['context']

    with open('data/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    context['quickreplies'] = list(reports) + ['Go back']

    return context


def search_sectors(request):
    context = request['context']
    entities = request['entities']

    global location
    location = first_entity_value(entities, 'report_location')

    with open('data/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    try:
        context['quickreplies'] = list(reports[location]) + ['Change']
    except KeyError:
        context['quickreplies'] = ['Change']

    return context


def search_reports(request):
    context = request['context']
    entities = request['entities']

    sector = first_entity_value(entities, 'report_sector')
    if sector:
        reports = pb.market_reports(location, sector)
        if reports:
            context['reports'] = reports[1]
        else:
            context['missing_reports'] = True
    else:
        context['missing_report'] = True

    return context


def goodbye(request):
    '''
    update context to let send() know conversation is finished
    '''
    context = request['context']
    context['exit'] = True
    return context

actions = {
    'send': send,
    'get_definition': search_glossary,
    'get_class': search_classes,
    'get_pdinfo': search_projects,
    'get_doc': search_docs,
    'get_lp': search_docs,
    'get_locations': search_locations,
    'get_sectors': search_sectors,
    'get_reports': search_reports,
    'goodbye': goodbye
}

client = Wit(access_token, actions=actions)
client.interactive()
