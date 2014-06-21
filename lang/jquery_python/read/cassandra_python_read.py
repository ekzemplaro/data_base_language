#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	cassandra_python_read.py
#
#					Sep/04/2013
#
# ----------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	json
import	cql
#
sys.path.append ('/var/www/data_base/common/python_common')
from cassandra_manipulate import cassandra_to_dict_proc
# ----------------------------------------------------------------
#
print "Content-type: text/json\n\n"
#
host = 'localhost'
port = 9160
keyspace = 'city'
con = cql.connect (host,port,keyspace,cql_version='3.0.0')
cursor = con.cursor()
#
dict_aa = cassandra_to_dict_proc (cursor)
#
cursor.close()
con.close()
#
json_str = json.dumps (dict_aa)
#
print	json_str
#
#
# ----------------------------------------------------------------
