#!/usr/bin/python3
"""
Planbot's Facebook application. Handles requests and responses through the
Wit and Facebook Graph APIs.
"""

import os
import logging

import requests
from bottle import Bottle, request, debug

from components.engine import Engine

# set environmental variables
FB_PAGE_TOKEN = os.environ.get('FB_PAGE_TOKEN')
FB_VERIFY_TOKEN = os.environ.get('FB_VERIFY_TOKEN')

# setup Bottle Server
debug(True)
app = application = Bottle()

# setup logging
logging.basicConfig(level=logging.INFO)


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

                logging.info('Message received: {}'.format(text))
                bot = Engine(user=fb_id, message=text)
                for response in bot.response():
                    sender_action(fb_id)
                    send(response)
    else:
        return 'Received Different Event'
    return None


def sender_action(sender_id):
    data = {'recipient': {'id': sender_id}, 'sender_action': 'typing_on'}
    qs = 'access_token=' + FB_PAGE_TOKEN
    resp = requests.post('https://graph.facebook.com/v2.9/me/messages?' + qs,
                         json=data)

    return resp.content


def send(response):
    fb_id = response['id']
    text = response['text']
    quickreplies = cards = None

    # check for quickreplies
    if response.get('quickreplies'):
        quickreplies = format_qr(response['quickreplies'])

    # check for urls
    if text.startswith('http'):
        urls = text.split()
        titles = response['title']
        cards = template(titles, urls)

    fb_message(fb_id, text, quickreplies, cards)


def fb_message(sender_id, text, quickreplies, cards):
    data = {'recipient': {'id': sender_id}}

    data['message'] = cards if cards \
        else{'text': text, 'quick_replies': quickreplies} if quickreplies \
        else {'text': text}

    # logging.info('response = {}'.format(data))

    qs = 'access_token=' + FB_PAGE_TOKEN
    resp = requests.post('https://graph.facebook.com/v2.9/me/messages?' + qs,
                         json=data)

    return resp.content


def format_qr(quickreplies):
    return [{
        'title': qr,
        'content_type': 'text',
        'payload': 'empty'}
            for qr in quickreplies]


def template(titles, urls):
    if not isinstance(titles, list):
        titles = [titles]
    if not isinstance(urls, list):
        urls = urls.split()

    button_titles = ['Download' if url.endswith('pdf') else 'View'
                     for url in urls]

    assert len(titles) == len(urls)

    elements = [{
        'title': titles[i],
        'default_action': {
            'type': 'web_url',
            'url': urls[i]},
        'buttons': [{
            'type': 'web_url',
            'url': urls[i],
            'title': button_titles[i]}]}
             for i in range(len(titles))]

    return {
        "attachment": {
            "type": "template",
            "payload": {
                "template_type": "generic",
                "elements": elements}}}
