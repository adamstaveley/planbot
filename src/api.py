#!/usr/bin/python3
"""
Handle GET requests to api.planbot.co domain. Returns 'result' key if
'success' key is true, or 'reason' key if 'success' is false. The result
value is simply the response from the relevant planbot api call.
"""

import json
import logging

from bottle import Bottle, response

from components.planbot import Planbot
from components.connectdb import ConnectDB

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
        if params[0] == 'reports':
            resp = handle_report_query(params[1])
        else:
            resp = answer_query(params)
    elif len(params) == 3:
        resp = handle_report_query(location=params[1], sector=params[2])
    else:
        resp = {'success': False, 'error': 'invalid number of parameters'}

    return json.dumps(resp)


def return_all_data(action):
    resp = dict()

    if action == 'reports':
        return handle_report_query()

    try:
        db = ConnectDB(switch[action][1])
        res = db.query_keys()
    except KeyError:
        resp['success'] = False
        resp['error'] = 'action \'{}\' not found'.format(action)
    else:
        resp['success'] = True
        resp['result'] = res
        db.close()
    finally:
        return resp


def answer_query(params):
    action, param = params
    action = switch[action]
    resp = dict()

    try:
        planbot = Planbot()
        result, options = get_result(planbot.run_task(action=action,
                                                      query=param))
    except KeyError:
        resp['success'] = False
        resp['error'] = 'action \'{}\' not found'.format(action)
    else:
        if not result and not options:
            resp['success'] = False
            resp['error'] = 'no result found for \'{}\''.format(param)
        else:
            resp['success'] = True
            resp['result'] = {
                'value': result,
                'options': options}
    finally:
        return resp


def handle_report_query(location=None, sector=None):
    resp = dict()
    db = ConnectDB('reports')

    res = db.query_reports(loc=location, sec=sector)
    if res:
        resp['success'] = True
        resp['result'] = res
    else:
        resp['success'] = False
        resp['error'] = 'no results found for given location/sector'

    db.close()
    return resp


switch = {
    'define': 'definitions',
    'use': 'use_classes',
    'project': 'projects',
    'doc': 'documents',
    'lp': 'local_plans',
    'reports': 'reports'}
