import os
import json
import logging

import requests
from bottle import Bottle, request, response, debug

from planbot import Planbot
from connectdb import ConnectDB

CLIENT_ID = os.environ.get('CLIENT_ID')
CLIENT_SECRET = os.environ.get('CLIENT_SECRET')
VERIFY_TOKEN = os.environ.get('VERIFY_TOKEN')

debug = True
app = application = Bottle()


@app.get('/slack')
def code_exchange():
    code = request.query.get('code')
    if code:
        data = {
            'client_id': CLIENT_ID,
            'client_secret': CLIENT_SECRET,
            'code': code}

        resp = requests.post('https://slack.com/api/oauth.access', data=data)
        content = json.loads(resp.content.decode())
        if content['ok']:
            return 'Install successful'
        else:
            return 'Install unsuccessful'
    else:
        return 'Invalid request type'


@app.post('/slack')
def slack_post():
    data = request.forms
    if not data['token'] == VERIFY_TOKEN:
        return None
    else:
        cmd = data['command'].strip('/')
        text = data['text']
        url = data['response_url']

    resp = {}
    resp['response_type'] = 'ephemeral'  # or 'in_channel' for all users

    pb = Planbot()
    result = options = None

    if not text:
        resp['text'] = 'No query! Type \'/{} help\' for more'.format(cmd)
    if text == 'help':
        resp['text'] = help_text(cmd)
    else:
        result, options = pb.run_task(action=switch[cmd], query=text)
        resp['text'] = format_text(result=result, options=options)

    send(url, resp)
    return None


def send(url, resp):
    response.headers['Content-Type'] = 'application/json'
    res = requests.post(url, json=resp)
    return res.content


def format_text(result=None, options=None):
    if result:
        text = ': '.join(result)
    elif options:
        text = 'No match! Did you mean: {}'.format(', '.join(options))
    else:
        text = 'Sorry, no matches found for your query.'
    return text


def help_text(cmd):
    db = ConnectDB('responses')
    text = db.query_response(cmd + '-help')
    db.close()
    return text['text']


switch = {
    'define': 'definitions',
    'use': 'use_classes',
    'project': 'projects',
    'doc': 'documents',
    'lp': 'local_plans'}


if __name__ == '__main__':
    app.run()
