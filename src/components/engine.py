import logging

import redis

from planbot import Planbot, titlecase
from connectdb import ConnectDB


class Engine:

    actions = {
        'GET_STARTED_PAYLOAD': None,
        'CONTACT_PAYLOAD': None,
        'DEFINE_PAYLOAD': 'definitions',
        'USE_PAYLOAD': 'use_classes',
        'PD_PAYLOAD': 'projects',
        'DOC_PAYLOAD': 'documents',
        'LP_PAYLOAD': 'local_plans',
        'REPORT_PAYLOAD': 'reports'}

    def __init__(self):
        self.context = self.user = self.message = self.resp = None
        self.resp_array = []

    def response(self, user=None, message=None):
        context = self.get_context(user)
        self.context = None if context == 'None' else context
        self.user, self.message = user, message
        self.resp = {'id': user}
        self.run_actions()
        self.set_context(self.user, self.context)

        self.resp_array.append(self.resp)
        response = self.resp_array
        self.resp = None
        self.resp_array = []
        return response

    @staticmethod
    def set_context(key, value):
        store = redis.StrictRedis()
        store.set(key, value)
        return None

    @staticmethod
    def get_context(key):
        store = redis.StrictRedis(decode_responses=True)
        return store.get(key)

    @staticmethod
    def query_db(message):
        db = ConnectDB('responses')
        response = db.query_response(message)
        db.close()
        return response

    def run_actions(self):
        if not self.context or self.message in self.actions:
            self.init_branch()
        elif self.context == 'REPORT_PAYLOAD_SECTOR':
            if self.message == 'Cancel':
                self.select_response()
            else:
                self.report_sectors()
        else:
            self.select_response()
        return None

    def init_branch(self):
        self.context = None
        if self.message not in self.actions:
            self.resp.update(self.query_db(self.message))
            return None
        elif self.message in ['GET_STARTED_PAYLOAD', 'CONTACT_PAYLOAD']:
            pass
        else:
            call = '_SECTOR' if self.message == 'REPORT_PAYLOAD' else '_CALL'
            self.context = self.message + call

        self.resp.update(self.query_db(self.message))
        self.next_steps()
        return None

    def next_steps(self):
        if self.message == 'CONTACT_PAYLOAD':
            first_message = dict(self.resp)
            self.resp_array.append(first_message)
            self.resp.update({
                'title': ['My website', 'My Facebook page'],
                'text': 'https://planbot.co https://fb.me/planbotco'})
        else:
            qr = self.resp['quickreplies']
            if qr:
                self.resp['quickreplies'] = qr.split('/')
        return None

    def report_sectors(self):
        self.set_context(str(self.user) + 'loc', self.message)
        self.resp.update(self.query_db('REPORT_PAYLOAD_SECTOR'))
        db = ConnectDB('reports')
        sectors = [titlecase(sec) for sec in db.distinct_sectors(self.message)]
        self.resp['quickreplies'] = sectors + ['Go back']
        db.close()
        self.context = 'REPORT_PAYLOAD_CALL'
        return None

    def select_response(self):
        if self.message.startswith(('Try again', 'More', 'Go back')):
            self.message = self.context.replace('_CALL', '')
            self.init_branch()
        elif self.context.endswith(('CALL', 'SECTOR')) and \
                not self.message == 'Cancel':
            self.call()
        else:
            if self.message in ['Cancel', 'Thanks, bye!']:
                self.context = None
            self.resp.update(self.query_db(self.message))
        return None

    def call(self):
        self.context = self.context.replace('_CALL', '')
        action = self.actions[self.context]
        pb = Planbot()
        if self.context == 'REPORT_PAYLOAD':
            location = self.get_context(str(self.user) + 'loc')
            result, options = pb.run_task(action=action,
                                          query=location,
                                          sector=self.message)
        else:
            result, options = pb.run_task(action=action, query=self.message)

        self.process_call(result=result, options=options)
        return None

    def process_call(self, result=None, options=None):
        if result:
            self.format_result(result)
            first_message = dict(self.resp)
            self.resp_array.append(first_message)
            if self.resp.get('title'):
                del self.resp['title']
            self.resp.update(self.query_db('Success'))
            branch = self.actions[self.context].replace('_', ' ')
            self.resp['quickreplies'] = ['More ' + branch, 'Thanks, bye!']
        elif options:
            self.format_options(options)
            self.resp['quickreplies'] = options + ['Cancel']
            self.context += '_CALL'
        else:
            self.resp.update(self.query_db('Failure'))
            self.resp['quickreplies'] = self.resp['quickreplies'].split('/')
        return None

    def format_result(self, result):
        if self.context in ['DEFINE_PAYLOAD', 'USE_PAYLOAD']:
            if len(result) == 16:
                self.resp['text'] = self.format_text(uses=result)
            else:
                self.resp['text'] = self.format_text(pair=result)
            self.resp['quickreplies'] = None
            return None
        elif self.context == 'REPORT_PAYLOAD':
            result = self.format_text(reports=result)

        self.resp['title'] = result[0]
        self.resp['text'] = result[1]
        self.resp['quickreplies'] = None
        return None

    def format_options(self, options):
        msg = self.query_db('options')['text']
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
