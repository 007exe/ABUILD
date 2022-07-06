# -*- coding: utf-8 -*-


class SkyFront:
    "SQL front end."

    version = '1.0'

    backend = ''
    __db = None
    cursor = None
    ATTACHED = False

    def __init__(self, backend=None, *args, **kwargs):
        if backend:
            self.attach(backend, *args, **kwargs)

    def chooseBackend(self, backend='sqlite'):
        """Setup sql backend for work."""
        self.backend = backend
        if backend == 'mysql':
            try:
                self.__backend = __import__('MySQLdb')
                self.__cursorclass = self.__backend.cursors.DictCursor
            except ImportError, e:
                print e
            else:
                if "db" not in vars:
                    print "Database not specified"
                elif "user" not in vars:
                    print "Database user name not specified"
                elif "passwd" not in vars:
                    print "Database user password not specified"
                else:
                    return True
        elif backend == 'sqlite':
            try:
                self.__backend = __import__('sqlite3')
                self.__cursorclass = self.__backend.Cursor
            except ImportError, e:
                print e
            else:
                return True
        else:
            print "Backend not supported yet."

    def connect(self, *args, **kwargs):
        self.__db = self.__backend.connect(*args, **kwargs)
        self.cursor = self.__db.cursor(self.__cursorclass)

    def attach(self, backend=None, *args, **kwargs):
        if self.chooseBackend(backend):
            try:
                self.connect(*args, **kwargs)
                self.ATTACHED = True
            except Exception, e:
                print 'Connection not made: {0}'.format(e)
        else:
            print 'Backend not choosed.'
            self.ATTACHED = False

    def deattach(self):
        """Close connection to database and set generator mode."""
        if self.backend and self.__db:
            self.__db.close()
        self.backend = ''
        self.__db = None
        self.__cursorclass = None
        self.cursor = None
        self.ATTACHED = False

    @classmethod
    def escape(self, string):
        return self.forceUnicode(string).replace(u"'", u"''")

    @classmethod
    def forceUnicode(self, s, encoding='utf-8'):
        if isinstance(s, unicode):
            return s
        if not isinstance(s, basestring,):
            if hasattr(s, '__unicode__'):
                s = unicode(s)
            else:
                s = unicode(str(s), encoding, 'strict')
        elif not isinstance(s, unicode):
            s = s.decode(encoding, 'strict')
        return s

    def executeQuery(self, query, action="select"):
        """Executes query string.
Returns two variables status of execution (bool) and its result.
`action` parameter specifies returned result type. With the default
action `select` multiple results where returned, it returns last row id
with `insert`.
If error occurs error string will be returned as result.
If backend was not specified or class works as query generator, query
string will be returned.
"""
        if not self.ATTACHED:
            return query
        c = self.cursor
        try:
            c.execute(query)
        except Exception, e:
            return [False, self.forceUnicode(e)]
        self.__db.commit()
        if action == "select":
            fetch = c.fetchall()
            return [True, fetch]
        if action == "insert":
            return [True, c.lastrowid]

    def insertNew(self, tbl, __update=[], **vars):
        """Creates 'INSERT' query.
If second non-keyword argument passed, it will be interprited as list
of fields which should be updated on dublicate key.
"""
        fields = []
        values = []
        update = ''
        escape = self.escape
        for name in vars.keys():
            if vars[name] is not None:
                fields.append(escape(name))
                values.append(escape(vars[name]))
        if __update and len(__update) > 0:
            up = ["{0} = '{1}'".format(escape(name), escape(vars[name]))
                  for name in __update if vars.get(name, None) is not None]
            if len(up) > 0:
                update = ', '.join(self.forceUnicode(up))
                update = 'ON DUPLICATE KEY UPDATE {0}'.format(update)
        fields = ', '.join(fields)
        values = "', '".join(values)
        insert = self.forceUnicode("INSERT INTO `{0}` ({1}) VALUES('{2}')")\
            .format(tbl, fields, self.forceUnicode(values))
        qw = ' '.join(filter(None, [insert, update]))
        return self.executeQuery(qw, 'insert')

    def delete(self, tbl, delete_all_records=False, **vars):
        """Creates 'DELETE FROM' query
For deleting all records user must specify `delete_all_records` parameter
"""
        c = self.createClause(**vars)
        if not c and not delete_all_records:
            return [False, 'Please pass delete_all_records to make'
                    'complete deletion.']
        return self.executeQuery("DELETE FROM {0} {1}".format(tbl, c))

    def find(self, tbl, value, column, *fields):
        """Finds certain record in database. Generates 'SELECT' query with limit 1.
Usage: (table, find_value, find_column, return_columns).
`id` column will be added if not specified
"""
        fields = list(fields)
        try:
            fields.index('id')
        except:
            fields.append('id')
        var = {column: value}
        return self.getRecords(tbl, select=fields, limit=1, **var)

    def getCount(self, tbl, **vars):
        """Generates SELECT COUNT(*) query."""
        clause = self.createClause(**vars)
        qw = 'SELECT COUNT(*) FROM `{0}` {1}'.format(tbl, clause)
        ret = self.executeQuery(qw)
        if type(ret) == list and ret[0] and self.ATTACHED:
            ret[1] = ret[1][0][0]
        return ret

    def getRecords(self, tbl, select=[], QueryJoins='', limit=0,
                   limstart=0, order='', **vars):
        """Generates 'SELECT FROM' query.
If second keyword argument not specified, mask `*` will be used.
limit and limstart specify 'LIMIT' parameter.
"""
        select = ','.join(select) if len(select) else '*'
        limit = 'LIMIT {0},{1}'.format(limstart, limit) if limit else ''
        order = 'ORDER BY {0}'.format(order) if order else ''

        clause = self.createClause(**vars)
        qw = ' '.join(filter(None, [
            'SELECT DISTINCT {0} FROM `{1}`'.format(select, tbl),
            QueryJoins, clause, order, limit]))
        return self.executeQuery(qw)

    def updateRecords(self, tbl, __skyfront_set={}, **vars):
        """Generates 'UPDATE SET' query."""
        update = []
        for key in __skyfront_set.keys():
            update.append(u"{0}='{1}'".format(self.escape(key),
                          self.escape(__skyfront_set[key])))
        update = u', '.join(update)
        clause = self.createClause(**vars)
        qw = u'UPDATE `{0}` SET {1} {2}'.format(tbl, update, clause)
        return self.executeQuery(qw)

    def createClause(self, _skyfront_and=True, **vars):
        """Creates 'WHERE' clause"""
        if not vars.keys():
            return ''

        def _l(lst, var):
            cl = []
            if len(lst) % 2:
                lst.append('=')
            for array, op in zip(*[lst[i::2] for i in range(2)]):
                if type(array) is list:
                    if not op:
                        op = 'OR'
                    subexp = u' {0} '.format(op).join(_l(array, var))
                    cl.append(u'({0})'.format(subexp))
                else:
                    cl.append(u"{0} {1} '{2}'".format(self.escape(var),
                              self.escape(op), self.escape(array)))
            return cl

        wclause = []
        for key, value in vars.items():
            if value:
                if type(value) is list:
                    wclause.extend(_l(value, key))
                else:
                    wclause.append(u"{0} = '{1}'".format(self.escape(key),
                                   self.escape(value)))

        if _skyfront_and:
            wclause = 'WHERE ' + ' AND '.join(wclause)
        else:
            wclause = 'WHERE ' + ' OR '.join(wclause)

        return wclause
