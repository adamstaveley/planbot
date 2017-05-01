import json
from collections import OrderedDict
from bottle import Bottle, request, response, get
import planbotsimple as pb

app = application = Bottle()

if __name__ == '__main__':
    app.run()


@app.get('/<action>/<param1>/<param2>')
def get_data(action, *param1, *param2):
    return None

@app.get('/<action>')
def return_all_data(action):
    response.header['Content-Type'] = 'application/json'
    resp = dict()

    try:
        with open(switch[action][1]) as js:
            pydict = json.load(js, object_pairs_hook=OrderedDict)
    except KeyError:
        resp['success'] = False
        resp['reason'] = '"{}" action not found'.format(action)
    else:
        resp['success'] = True
        resp['result'] = pydict
    finally:
        return json.dumps(resp)
        

@app.get('/<action>/<param>')
def return_specific_data(action, param):
    response.header['Content-Type'] = 'application/json'
    resp = dict()

    try:
        try:
            value, options = switch[action][0](param)   
        except Exception:
            if param == 'use':
                value = switch[action][0](param)
                options = None
            elif param == 'projects' or param == 'leagl':
                value, options = switch[action][0](param, switch[action][1])
    except KeyError as err:
        resp['success'] = False
        resp['reason'] = '"{}" action not found'.format(err)
    else:
        if value:
            resp['key'], resp['value'] = value
        elif options:
            resp['options'] = options
    finally:
        if resp['value'] or resp['options']:
            resp['success'] = True
        else:
            resp['success'] = False
            resp['reason'] = 'No information available for "{}"'.format(param)

        return json.dumps(resp)


@app.get('/reports/<location>')
def return_report_sectors(location):
    response.header['Content-Type'] = 'application/json'
    resp = dict()

    with open(switch['reports'][1]) as js:
        pydict = json.load(js, object_pairs_hook=OrderedDict)

    try:
        resp['result'] = pydict[location]
    except KeyError:
        resp['success'] = False
        resp['reason'] = 'No results for location "{}"'.format(location)
    else:
        resp['success'] = True
    finally:
        return json.dumps(resp)


@app.get('/reports/<location>/<sector>')
def return_reports(sector, location):
    response.header['Content-Type'] = 'application/json'
    resp = dict()
    
    with open(switch['reports'][1]) as js:
        pydict = json.load(js, object_pairs_hook=OrderedDict)

    try:
        resp['result'] = pydict[location][sector]
    except KeyError as err:
        resp['success'] = False
        resp['reason'] = '"{}" key not found:'.format(err)
    else:
        resp['success'] = True
    finally:
        return json.dumps(resp)


switch = {
    'glossary': [pb.definition, 'glossary.json'],
    'use': [pb.use_classes, 'use_classes.json'],
    'projects': [pb.get_link, 'development.json'],
    'legal': [pb.get_link, 'legislation.json'],
    'lp': [pb.local_plan, 'local_plans.json'],
    'reports', [pb.market_reports, 'reports.json']}

