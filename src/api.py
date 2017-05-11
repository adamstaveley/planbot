import json
from bottle import Bottle, request, response, get
from planbot import definitions, use_classes, get_link, local_plan, \
                    market_reports

app = application = Bottle()

if __name__ == '__main__':
    app.run()


def callback(obj):
    if obj.ready():
        return obj.get()
    else:
        return callback(obj)


@app.get('/<path:path>')
def process_params(path):
    response.headers['Content-Type'] = 'application/json'
    path = path.replace('-', ' ').replace('_', ' ').replace('%20', ' ')
    params = path.strip('/').split('/')

    if len(params) == 1:
        resp = return_all_data(path)
    elif len(params) == 2:
        if params[0] == 'reports':
            resp = handle_report_query(params[0], params[1])
        else:
            resp = answer_query(params)
    elif len(params) == 3:
        resp = handle_report_query(params[0], params[1], sector=params[2])
    else:
        resp = {'success': False, 'reason': 'invalid number of parameters'}

    return json.dumps(resp)


def return_all_data(action):
    resp = dict()

    try:
        filename = switch[action][1]
    except KeyError:
        resp['success'] = False
        resp['reason'] = 'action \'{}\' not found'.format(action)
    else:
        with open('data/' + filename) as f:
            pydict = json.load(f)
        resp['success'] = True
        resp['result'] = pydict
    finally:
        return resp


def answer_query(params):
    action, param = params
    alt_actions = ['project', 'doc']
    resp = dict()

    try:
        if action in alt_actions:
            f = switch[action][1]
            result, options = callback(switch[action][0].delay(param, f))
            result = None if result == (None, None) else result
        elif action == 'use':
            result = callback(switch[action][0].delay(param))
            options = None
        elif action == 'lp':
            result, options = callback(switch[action][0].delay(param))
            result = None if result == (None, None) else result
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
            resp['result'] = (result, options)
    finally:
        return resp


def handle_report_query(action, location, sector=None):
    resp = dict()

    def return_sector_list(loc, sec):
        with open('data/reports.json') as f:
            reports = json.load(f)

        try:
            result = reports[loc][sec] if sec else reports[loc]
            return {'success': True, 'result': result}
        except KeyError as e:
            return {'success': False, 'reason': '{} not found'.format(e)}

    try:
        switch[action]
    except Exception:
        resp['success'] = False
        resp['reason'] = 'only reports action takes two parameters'
    else:
        resp = return_sector_list(location, sector)
    finally:
        return resp


switch = {
    'define': [definitions, 'glossary.json'],
    'use': [use_classes, 'use_classes.json'],
    'project': [get_link, 'development.json'],
    'doc': [get_link, 'documents.json'],
    'lp': [local_plan, 'local_plans.json'],
    'reports': []}
