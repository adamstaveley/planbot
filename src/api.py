#!/usr/bin/python3
"""
Handle GET requests to api.planbot.co domain. Returns 'result' key if
'success' key is true, or 'reason' key if 'success' is false. The result
value is simply the response from the relevant planbot api call.
"""

import json
import logging

from bottle import Bottle, request, response, get

from planbot import *
from connectdb import ConnectDB

logging.basicConfig(level=logging.INFO)
app = application = Bottle()

if __name__ == '__main__':
    app.run()


def callback(obj):
    """Handle celery response."""

    try:
        return obj.get()
    except Exception as err:
        logging.info('Callback exception: {}'.format(err))


@app.get('/<path:path>')
def process_params(path):
    """Handle GET request with relevant function call and send response."""

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
        resp = {'success': False, 'reason': 'invalid number of parameters'}

    return json.dumps(resp)


def return_all_data(action):
    """Called if no specific parameter is given for an action."""

    resp = dict()

    if action == 'reports':
        return handle_report_query()

    try:
        db = ConnectDB(switch[action][1])
        res = db.query_keys()
    except KeyError:
        resp['success'] = False
        resp['reason'] = 'action \'{}\' not found'.format(action)
    else:
        resp['success'] = True
        resp['result'] = res
        db.close()
    finally:
        return resp


def answer_query(params):
    """Called if a specific parameter is given for an action."""

    action, param = params
    alt_actions = ['project', 'doc']
    resp = dict()

    try:
        if action in alt_actions:
            fun, db = switch[action]
            result, options = callback(fun.delay(param, db))
        else:
            result, options = callback(switch[action][0].delay(param))
    except KeyError:
        resp['success'] = False
        resp['reason'] = 'action \'{}\' not found'.format(action)
    else:
        if not result and not options:
            resp['success'] = False
            resp['reason'] = 'no result found for \'{}\''.format(param)
        else:
            resp['success'] = True
            resp['result'] = {
                'value': result
                'options': options}
    finally:
        return resp


def handle_report_query(location=None, sector=None):
    """Called by report action. Sector argument is optional."""

    resp = dict()
    res = None
    db = ConnectDB('reports')

    res = db.query_reports(loc=location, sec=sector)
    if res:
        resp['success'] = True
        resp['result'] = res
    else:
        resp['success'] = False
        resp['reason'] = 'no results found for given location/sector'

    db.close()
    return resp


switch = {
    'define': [definitions, 'glossary'],
    'use': [use_classes, 'use_classes'],
    'project': [get_link, 'projects'],
    'doc': [get_link, 'documents'],
    'lp': [local_plan, 'local_plans'],
    'reports': [market_reports, 'reports']}
