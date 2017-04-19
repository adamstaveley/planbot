from bottle import Bottle, request, response, get
import planbotsimple as pb
import json

app = application = Bottle()

if __name__ == '__main__':
    app.run()


@app.get('/glossary/<term>')
def get_handler(term):
    response.headers['Content-Type'] = 'application/json'

    # some planbot functions return a pre-processed result which needs to be
    # changed for the API - e.g. processing can be done in facebook.py
    definition, options = pb.definitions(term)
    if definition:
        result = 'definition'
        value = definition
    elif options:
        result = 'options'
        value = options
    else:
        result = value = None

    status = True if value else False

    return json.dumps({'success': status, result: value})


# /glossary/<term> becomes /<param1>/<param2>
# POST method
