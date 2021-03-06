#!/usr/bin/python3
"""
Handle GET requests to api.planbot.co domain. Returns 'result' key if
'success' key is true, or 'reason' key if 'success' is false. The result
value is simply the response from the relevant planbot api call.
"""

import json
import logging

from bottle import Bottle, response

from planbot import Planbot
from connectdb import ConnectDB

logging.basicConfig(level=logging.INFO)
app = application = Bottle()

if __name__ == '__main__':
    app.run()


@app.get('/<path:path>')
def process_params(path):
    response.headers['Content-Type'] = 'application/json'
    path = path.replace('-', ' ').replace('_', ' ').replace('%20', ' ')
    params = path.strip('/').split('/')

    if len(params) == 1:
        resp = return_all_data(params[0])
    elif len(params) == 2:
        resp = answer_query(params)
    else:
        resp = {'success': False, 'error': 'Invalid number of parameters'}

    return json.dumps(resp)


def return_all_data(action):
    resp = dict()

    try:
        db = ConnectDB(switch[action])
        res = db.query_keys()
    except KeyError:
        resp['success'] = False
        resp['error'] = 'Action \'{}\' not found'.format(action)
    else:
        resp['success'] = True
        resp['result'] = res
        db.close()
    finally:
        return resp


def answer_query(params):
    action, param = params
    resp = dict()

    try:
        pb = Planbot()
        result, options = pb.run_task(action=switch[action], query=param)
    except KeyError:
        resp['success'] = False
        resp['error'] = 'Action \'{}\' not found'.format(action)
    else:
        if not result and not options:
            resp['success'] = False
            resp['error'] = 'No result found for \'{}\''.format(param)
        else:
            resp['success'] = True
            resp['result'] = {
                'value': result,
                'options': options}
    finally:
        return resp


switch = {
    'define': 'definitions',
    'use': 'use_classes',
    'project': 'projects',
    'doc': 'documents',
    'lp': 'local_plans'}
