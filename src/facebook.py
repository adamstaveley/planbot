#! python3
# Facebook version of Planbot

import os
import logging
import json
from collections import OrderedDict
import requests
from wit import Wit
from bottle import Bottle, request, debug
from planbot import definitions, use_classes, get_link, local_plan, \
                    market_reports, titlecase

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
                if message.get('message'):
                    text = message['message']['text']
                else:
                    try:
                        text = message['postback']['payload']
                    except KeyError:
                        logging.info('No payload found in postback')
                        text = None
                    else:
                        if text == 'GET_STARTED_PAYLOAD':
                            text = 'Hi'

                logging.info('Message received: {}'.format(text))
                sender_action(fb_id)
                client.run_actions(session_id=fb_id, message=text)
    else:
        return 'Received Different Event'
    return None


def sender_action(sender_id):
    data = {'recipient': {'id': sender_id}, 'sender_action': 'typing_on'}
    qs = 'access_token=' + FB_PAGE_TOKEN
    resp = requests.post('https://graph.facebook.com/v2.9/me/messages?' + qs,
                         json=data)

    # logging.info('sender_action received: {}'.format(resp.content))

    return resp.content


def fb_message(sender_id, text, q_replies, cards):
    # Send response to Facebook Graph API
    data = {'recipient': {'id': sender_id}}

    data['message'] = {'text': text, 'quick_replies': q_replies} if q_replies \
        else cards if cards else {'text': text}

    # logging.info('data to be sent: {}'.format(data))

    qs = 'access_token=' + FB_PAGE_TOKEN
    resp = requests.post('https://graph.facebook.com/v2.9/me/messages?' + qs,
                         json=data)

    # logging.info('received: {}'.format(resp.content))

    return resp.content


def send(request, response):
    # Process response and send message
    fb_id = request['session_id']
    text = response['text'].decode('UTF-8')
    q_replies = cards = None

    # check for quickreplies
    if request['context'].get('quickreplies'):
        response['quickreplies'] = request['context']['quickreplies']
    if response['quickreplies']:
        q_replies = format_qr(response['quickreplies'])

    # check for urls
    if text.startswith('http'):
        urls = text.split()
        if request['context'].get('title'):
            titles = request['context']['title']
        else:
            titles = ('Null ' * len(urls)).split()

        cards = template(titles, urls)

    # flush context and session_id if conversation ends
    if request['context'].get('exit'):
        request.clear()
        response.clear()

    fb_message(fb_id, text, q_replies, cards)


def format_qr(quickreplies):
    return [{
        'title': qr,
        'content_type': 'text',
        'payload': 'empty'}
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


def join_key_val(key, value):
    return '{}: {}'.format(key, value)


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


def callback(obj):
    if obj.ready():
        return obj.get()
    else:
        return callback(obj)


def search_glossary(request):
    # Wit.ai action functions (see below)
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        res, options = callback(definitions.delay(phrase))
        if res:
            context['definition'] = join_key_val(res[0], res[1])
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
        res = callback(use_classes.delay(phrase))
        if res:
            context['info'] = join_key_val(res[0], res[1])
        else:
            context['missing_use'] = True
    else:
        context['missing_use'] = True

    return context


def search_projects(request):
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        res, options = callback(get_link.delay(phrase, 'development.json'))
        if res[1]:
            context['title'], context['link'] = res
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
        res, options = callback(get_link.delay(phrase, 'documents.json'))
        if res[1]:
            context['title'], context['link'] = res
        elif options:
            context['options'] = format_options(options)
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
        res, options = callback(local_plan.delay(location))
        if res[1]:
            context['title'], context['local_plan'] = res
        elif options:
            context['options'] = format_options(options)
            context['quickreplies'] = options + ['Go back']
        else:
            context['missing_loc'] = True
    else:
        context['missing_loc'] = True

    return context


def list_locations(request):
    context = request['context']

    with open('data/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    locations = [titlecase(loc) for loc in reports]
    context['quickreplies'] = locations + ['Go back']

    return context


def list_sectors(request):
    context = request['context']
    entities = request['entities']

    global LOCATION
    LOCATION = first_entity_value(entities, 'term')

    with open('data/reports.json') as js:
        reports = json.load(js, object_pairs_hook=OrderedDict)

    try:
        sectors = [titlecase(sec) for sec in reports[LOCATION.lower()]]
    except KeyError:
        context['quickreplies'] = ['Change']
    else:
        context['quickreplies'] = sectors + ['Change']
    finally:
        return context


def search_reports(request):
    # remember to add new locations/sectors as their own wit entities
    # limited to only 10 results
    context = request['context']
    entities = request['entities']

    sector = first_entity_value(entities, 'term')
    assert LOCATION
    if sector:
        res = callback(market_reports.delay(LOCATION, sector))
        if res:
            context['title'] = res[0][:10]
            context['reports'] = ', '.join(res[1][:10])
        else:
            context['missing_report'] = True
    else:
        context['missing_report'] = True

    del LOCATION
    return context


def goodbye(request):
    '''
    update context to let send() know conversation finished - may not always be
    needed but there are times where Wit won't 'flush' the session at end
    '''
    context = request['context']
    context['exit'] = True
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
    'get_reports': search_reports,
    'goodbye': goodbye
}

client = Wit(access_token=WIT_TOKEN, actions=actions)
logging.basicConfig(level=logging.INFO)

if __name__ == '__main__':
    app.run()
