#! python3
# Facebook version of Planbot

import logging
import os
import requests
import json
import planbotsimple as pb
from collections import OrderedDict
from wit import Wit
from bottle import Bottle, request, debug

# set environmental variables
WIT_TOKEN = os.environ.get('WIT_TOKEN')
FB_PAGE_TOKEN = os.environ.get('FB_PAGE_TOKEN')
FB_VERIFY_TOKEN = os.environ.get('FB_VERIFY_TOKEN')

# setup Bottle Server
debug(True)
app = application = Bottle()


# Facebook webhook GET/POST handling
@app.get('/webhook')
def messenger_webhook():
    verify_token = request.query.get('hub.verify_token')
    if verify_token == FB_VERIFY_TOKEN:
        challenge = request.query.get('hub.challenge')
        return challenge
    else:
        return 'Invalid Request or Verification Token'


@app.post('/webhook')
def messenger_post():
    data = request.json
    if data['object'] == 'page':
        for entry in data['entry']:
            messages = entry['messaging']
            if messages[0]:
                message = messages[0]
                fb_id = message['sender']['id']
                text = message['message']['text']
                client.run_actions(session_id=fb_id, message=text)
    else:
        return 'Received Different Event'
    return None


def fb_message(sender_id, text, q_replies, cards):
    # Send response to Facebook Graph API
    data = {'recipient': {'id': sender_id}}

    data['message'] = {'text': text, 'quick_replies': q_replies} if q_replies \
        else cards if cards else {'text': text}

    qs = 'access_token=' + FB_PAGE_TOKEN
    resp = requests.post('https://graph.facebook.com/me/messages?' + qs,
                         json=data)

    return resp.content


def send(request, response):
    # Process response and send message
    fb_id = request['session_id']
    text = response['text'].decode('UTF-8')
    q_replies = cards = None

    # check for quickreplies
    if not response['quickreplies']:
        response['quickreplies'] = request['context'].get('quickreplies')
    q_replies = quickreplies(response['quickreplies'])

    # check for urls
    if text.startswith('http'):
        urls = text.split()
        if request['context'].get('title'):
            titles = request['context']['title']
        else:
            titles = ('Null ' * len(urls)).split()

        cards = template(titles, urls)

    fb_message(fb_id, text, q_replies, cards)


def quickreplies(quickreplies):
    return [{
        'title': qr,
        'content_type': 'text',
        'payload': 'emtpy'}
            for qr in quickreplies]


def template(titles, urls):
    # Create template for URL cards
    if not isinstance(titles, list):
        titles = [titles]
    if not isinstance(urls, list):
        urls = urls.split()

    elements = [{
        'title': titles[i],
        'default_action': {
            'type': 'web_url',
            'url': urls[i]},
        'buttons': [{
            'type': 'web_url',
            'url': urls[i],
            'title': 'View'}]}
             for i in range(len(titles))]

    return {
        "attachment": {
            "type": "template",
            "payload": {
                "template_type": "generic",
                "elements": elements}}}


def format_options(options):
    return '\n\u2022 {}'.format('\n\u2022 '.join(options))


def first_entity_value(entities, entity):
    # Extract Wit.ai entity
    if entity not in entities:
        return None
    val = entities[entity][0]['value']
    if not val:
        return None
    return val['value'] if isinstance(val, dict) else val


def search_glossary(request):
    # Wit.ai action functions (see below)
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        definition, options = pb.glossary(phrase)
        if definition:
            context['definition'] = definition
        elif options:
            context['options'] = format_options(options)
            context['quickreplies'] = options + ['Go back']
        else:
            context['missing_def'] = True
    else:
        context['missing_def'] = True

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
        link, options = pb.get_link(phrase, 'development.json')
        if link:
            context['title'], context['link'] = link
        elif options:
            context['options'] = format_options(options)
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
            context['title'], context['link'] = link
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
        lp, title = pb.local_plan(location)
        if lp:
            context['title'], context['local_plan'] = lp
        else:
            context['missing_loc'] = True
    else:
        context['missing_loc'] = True

    return context


def list_locations(request):
    context = request['context']

    with open('data/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    context['quickreplies'] = list(reports) + ['Go back']

    return context


def list_sectors(request):
    context = request['context']
    entities = request['entities']

    location = first_entity_value(entities, 'report_location')

    with open('data/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    try:
        context['quickreplies'] = list(reports[location]) + ['Change']
    except KeyError:
        context['quickreplies'] = ['Change']

    global user_loc
    user_loc = location

    return context


def search_reports(request):
    context = request['context']
    entities = request['entities']

    global user_loc
    location = user_loc

    sector = first_entity_value(entities, 'report_sector')
    if sector:
        reports = pb.reports(user_loc, sector)
        if reports:
            context['title'], context['reports'] = reports
        else:
            context['missing_report'] = True
    else:
        context['missing_report'] = True

    del user_loc
    return context


actions = {
    'send': send,
    'get_definition': search_glossary,
    'get_class': search_classes,
    'get_pdinfo': search_projects,
    'get_docs': search_docs,
    'get_lp': search_plans,
    'get_locations': list_locations,
    'get_sectors': list_sectors,
    'get_reports': search_reports
}

client = Wit(access_token=WIT_TOKEN, actions=actions)
logging.basicConfig(level=logging.INFO)

if __name__ == '__main__':
    app.run()
