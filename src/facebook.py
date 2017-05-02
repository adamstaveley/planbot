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

                logging.info('Message received: {}'.format(text))

                if not text:
                    try:
                        postback = message['postback']['payload']
                    except KeyError:
                        logging.info('No payload found in postback')
                    else:
                        text = manage_postbacks(postback)
                client.run_actions(session_id=fb_id, message=text)
    else:
        return 'Received Different Event'
    return None


def manage_postbacks(pb):
    try:
        return postbacks[pb]
    except Exception as error:
        logging.info('A postback exception occurred:' + error)
        return pb


def fb_message(sender_id, text, q_replies, cards):
    # Send response to Facebook Graph API
    data = {'recipient': {'id': sender_id}, 'sender_action': 'typing_on'}

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


def search_glossary(request):
    # Wit.ai action functions (see below)
    context = request['context']
    entities = request['entities']

    phrase = first_entity_value(entities, 'term')
    if phrase:
        definition, options = pb.definitions(phrase)
        if definition:
            context['definition'] = join_key_val(definition[0], definition[1])
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
        use = pb.use_classes(phrase)
        if use:
            context['info'] = join_key_val(use[0], use[1])
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
        link, options = pb.get_link(phrase, 'development.json')
        if link[1]:
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
        link, options = pb.get_link(phrase, 'documents.json')
        if link[1]:
            context['title'], context['link'] = link
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
        plan, options = pb.local_plan(location)
        if plan[1]:
            context['title'], context['local_plan'] = plan
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

    context['quickreplies'] = list(reports) + ['Go back']

    return context


def list_sectors(request):
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
    # remember to add new locations/sectors as their own wit entities
    context = request['context']
    entities = request['entities']

    sector = first_entity_value(entities, 'report_sector')
    if sector:
        reports = pb.market_reports(location, sector)
        if reports:
            context['title'], context['reports'] = reports
        else:
            context['missing_report'] = True
    else:
        context['missing_report'] = True

    return context


def goodbye(request):
    '''
    update context to let send() know conversation finished - may not always be
    needed but there are times where Wit won't 'flush' the session at end
    '''
    context = request['context']
    context['exit'] = True
    return context


postbacks = {
    "START_PAYLOAD": "Hi",
    "DEFINE_PAYLOAD": "Definition",
    "INFO_PAYLOAD": "Information",
    "POLICY_PAYLOAD": "Policy/legal",
    "LP_PAYLOAD": "Local plan",
    "REPORT_PAYLOAD": "Market report"
}

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
