import logging

import redis

from planbot import Planbot, titlecase
from connectdb import ConnectDB


def get_result(obj):
    try:
        return obj.get()
    except Exception as err:
        logging.info('Callback exception: {}'.format(err))


class Engine:
    """
    This class should return an array consisting of messages. Each message
    is a dictionary consisting of fields: id, text, title (for templates) and
    quickreplies.
    """

    actions = {
        'GET_STARTED_PAYLOAD': None,
        'DEFINE_PAYLOAD': 'definitions',
        'USE_PAYLOAD': 'use_classes',
        'PD_PAYLOAD': 'projects',
        'DOC_PAYLOAD': 'documents',
        'LP_PAYLOAD': 'local_plans',
        'REPORT_PAYLOAD': 'reports'}

    def __init__(self, user=None, message=None):
        self.user = user
        self.message = message
        self.resp = {'id': user}
        self.multi_resp = []
        self.run_actions()

    @staticmethod
    def set_context(key, value):
        store = redis.Redis(connection_pool=redis.ConnectionPool())
        store.set(key, value)
        return None

    @staticmethod
    def get_context(key):
        store = redis.Redis(connection_pool=redis.ConnectionPool())
        return store.get(key)

    def del_context(self):
        store = redis.Redis(connection_pool=redis.ConnectionPool())
        store.delete(self.user)
        return None

    @staticmethod
    def query_db(message):
        db = ConnectDB('responses')
        response = db.query_response(message)
        db.close()
        return response

    def run_actions(self):
        context = Engine.get_context(self.user)
        if not context:
            self.init_branch()
        elif self.message in self.actions and self.message not in context:
            self.init_branch()
        elif context == 'REPORT_PAYLOAD_SECTOR':
            self.report_sectors()
        else:
            self.get_response()
        return None

    def init_branch(self):
        if self.message not in self.actions:
            self.message = 'NO_PAYLOAD'
        else:
            Engine.set_context(self.user, self.message + '_CALL')

        response = Engine.query_db(self.message)

        self.resp['text'] = response['message']
        if self.message == 'REPORT_PAYLOAD':
            db = ConnectDB('reports')
            self.resp['quickreplies'] = db.distinct_locations() + ['Cancel']
            db.close()
            Engine.set_context(self.user, 'REPORT_PAYLOAD_SECTOR')
        elif self.message == 'CONTACT_PAYLOAD':
            self.contact()
        else:
            qr = response['quickreplies']
            if qr:
                qr_array = qr.split('/')
                self.resp['quickreplies'] = [titlecase(qr) for qr in qr_array]
        return None

    def report_sectors(self):
        location = Engine.get_context(self.user + 'loc')
        response = Engine.query_db('REPORT_PAYLOAD_SECTOR')
        self.resp['text'] = response['message']
        db = ConnectDB('reports')
        self.resp['quickreplies'] = db.distinct_sectors(location) + ['Go back']
        db.close()
        Engine.set_context(self.user, 'REPORT_PAYLOAD_CALL')
        return None

    def contact(self):
        self.resp.update(Engine.query_db(self.message))
        next_resp = {
            'title': ['My website', 'My Facebook page'],
            'text': 'https://planbot.co https://fb.me/planbotco'}
        self.multi_resp = [self.resp, next_resp]
        return None

    def get_response(self):
        context = Engine.get_context(self.user)
        if self.message in ['Cancel', 'Thanks, bye!']:
            self.del_context()
        elif self.message == 'Try again':
            Engine.set_context(self.user, context.replace('_CALL', ''))
            self.init_branch()
        elif context.endswith('CALL'):
            self.call(context)
        else:
            response = Engine.query_db(self.message)
            self.resp.update(response)
        return None

    def call(self, context):
        context = context.replace('_CALL', '')
        action = self.actions[context]
        if context == 'REPORT_CONTEXT':
            location = Engine.get_context(self.user + 'loc')
            pb = Planbot.delay(action, location, sector=self.message)
            result, options = get_result(pb.result())
        else:
            pb = Planbot.delay(action, self.message)
            result, options = get_result(pb.result())

        self.process_call(context, result=result, options=options)
        return None

    def process_call(self, context, result=None, options=None):
        if result:
            self.format_result(context, result)
            next_resp = Engine.query_db('success')
            branch = self.actions[context].replace('_', ' ')
            next_resp['quickreplies'] = ['More ' + branch, 'Thanks, bye!']
            self.multi_resp = [self.resp, next_resp]
        elif options:
            self.format_options(options)
            self.resp['quickreplies'] = options + ['Cancel']
            Engine.set_context(self.user, context + '_CALL')
        else:
            self.resp.update(Engine.query_db('Failure'))
        return None

    def format_result(self, context, result):
        if context in ['DEFINE_PAYLOAD', 'USE_PAYLOAD']:
            if len(result) == 16:
                self.resp['text'] = Engine.format_text(uses=result)
            else:
                self.resp['text'] = Engine.format_text(pair=result)
            return None
        elif context == 'REPORT_PAYLOAD':
            result = self.format_text(reports=result)

        self.resp['title'] = result[0]
        self.resp['text'] = result[1]
        return None

    def format_options(self, options):
        msg = Engine.query_db('options')['message']
        self.resp['text'] = msg + self.format_text(options=options)
        return None

    @staticmethod
    def format_text(pair=None, options=None, uses=None, reports=None):
        if pair:
            return '{}: {}'.format(pair[0], pair[1])
        elif options:
            return '\n\u2022 {}'.format('\n\u2022 '.join(options))
        elif uses:
            return '\n'.join(sorted(uses))
        elif reports:
            titles = reports[0][:10]
            urls = ' '.join(reports[1][:10])
            return titles, urls

    def response(self):
        try:
            return self.multi_resp
        except AttributeError:
            return self.resp
