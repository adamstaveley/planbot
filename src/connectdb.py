import psycopg2
from psycopg2.sql import SQL, Identifier


class ConnectDB():
    '''Connect to the planbot database and access a table.'''

    tables = ['glossary', 'use_classes', 'projects', 'documents',
              'local_plans', 'reports']

    def __init__(self, table):
        self.conn = psycopg2.connect('dbname=planbot')
        self.cursor = self.conn.cursor()
        if table not in self.tables:
            raise Exception('Invalid table: {}'.format(table))
        else:
            self.table = table

    def query_keys(self):
        '''Return all keys from a table.'''

        self.cursor.execute(SQL("SELECT key FROM {}").format(
            Identifier(self.table)))
        return [k[0] for k in self.cursor.fetchall()]

    def query_spec(self, phrase, spec=None):
        '''Submit a database lookup. The spec kwarg takes one of 'EQL' or
           'LIKE' for respective lookup types. EQL returns a sole key-value
           whereas LIKE returns multiple keys where the query is found.'''

        assert spec in ['EQL', 'LIKE']
        if spec == 'EQL':
            self.cursor.execute(SQL("SELECT * FROM {} WHERE key=%s").format(
                Identifier(self.table)), [phrase])
            res = self.cursor.fetchone()

        elif spec == 'LIKE':
            phrase = '%{}%'.format(phrase)
            self.cursor.execute(SQL(
                "SELECT key FROM {} WHERE key LIKE %s").format(
                Identifier(self.table)), [phrase])
            res = self.cursor.fetchall()

        return res

    def distinct_locations(self):
        '''Returns only unique report locations.'''

        assert self.table == 'reports'
        self.cursor.execute("SELECT DISTINCT location FROM reports")
        res = self.cursor.fetchall()
        return [r[0] for r in res]

    def distinct_sectors(self, loc):
        '''Returns only unique report sectors for a given location.'''

        assert self.table == 'reports'
        self.cursor.execute('''SELECT DISTINCT sector FROM reports
                               WHERE location=%s''', [loc])

        res = self.sector.fetchall()
        return [r[0] for r in res]

    def query_reports(self, loc=None, sec=None):
        '''Returns report table query given a location and sector,
           sorted by date.'''

        assert self.table == 'reports'

        if not loc:
            # no location / sector ignored -> return everything
            self.cursor.execute('''SELECT location, sector, title, date, url
                                   FROM reports''', [loc])

        elif not sec:
            # location but no sector -> return all given location
            self.cursor.execute('''SELECT sector, title, url FROM reports
                                   WHERE location=%s''', [loc])

        else:
            # location and sector -> return date-ordered reports 
            self.cursor.execute('''SELECT title, url FROM reports
                                   WHERE location=%s AND sector=%s
                                   ORDER BY date DESC''', (loc, sec))

        return self.cursor.fetchall()

    def close(self):
        '''Close connection to database.'''

        self.conn.close()
