import os

import requests
from bottle import Bottle, request, response, debug

from planbot import Planbot
from connectdb import ConnectDB

SLACK_VERIFY_TOKEN = os.environ.get('SLACK_VERIFY_TOKEN')

debug = True
app = application = Bottle()


@app.post('/slack')
def slack_post():
    data = request.forms
    if not data['token'] == SLACK_VERIFY_TOKEN:
        return None
    else:
        cmd = data['command'].strip('/')
        text = data['text'].split(' &amp;&amp; ')
        url = data['response_url']

    resp = {}
    resp['response_type'] = 'ephemeral'  # or 'in_channel' for all users

    pb = Planbot()
    result = options = None

    if len(text) == 1:
        if text[0] == 'help':
            resp['text'] = help_text(cmd)
        elif cmd == 'reports':
            resp['text'] = report_sectors(text[0])
        else:
            result, options = pb.run_task(action=switch[cmd], query=text[0])
    elif len(text) == 2:
        if cmd == 'reports':
            result, options = pb.run_task(action=switch[cmd],
                                          query=text[0],
                                          sector=text[1])
        else:
            resp['text'] = '{} takes one argument.'.format(cmd)
    else:
        resp['text'] = 'Invalid query! Type "/{} help" for more \
            information'.format(cmd)

    if not resp.get('text'):
        resp['text'] = format_text(cmd, result=result, options=options)

    send(url, resp)
    # account for help text
    return None


def send(url, resp):
    response.headers['Content-Type'] = 'application/json'
    res = requests.post(url, json=resp)
    return res.content


def format_text(cmd, result=None, options=None):
    if result:
        if cmd == 'reports':
            text = format_reports(result)
        else:
            text = ': '.join(result)
    elif options:
        text = 'No match! Did you mean: {}'.format(', '.join(options))
    else:
        text = 'Sorry, no matches found for your query.'
    return text


def format_reports(result):
    titles = result[0]
    urls = result[1]
    text = ('{} - {}'.format(titles[i], urls[i]) for i in range(len(titles)))
    text = '\n'.join(text)
    return text


def report_sectors(location):
    db = ConnectDB('reports')
    sectors = db.distinct_sectors(location)
    sectors = ', '.join(sec.capitalize() for sec in sectors)
    text = 'Available sectors: {}'.format(sectors)
    db.close()
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
    'lp': 'local_plans',
    'reports': 'reports'}


if __name__ == '__main__':
    app.run()
