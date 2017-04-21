import json
from collections import OrderedDict
from bottle import Bottle, request, response, get
import planbotsimple as pb

app = application = Bottle()

if __name__ == '__main__':
    app.run()

# get(<actions>/<phrase>)
# get(<reports>/<sector>/<location>)