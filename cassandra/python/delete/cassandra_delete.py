#!/usr/bin/python
# -*- coding:utf-8 -*-
#
#	cassandra_delete.py
#						Sep/06/2013
#
# ---------------------------------------------------------------
import	sys
import	cql
#
sys.path.append ('/var/www/data_base/common/python_common')
from cassandra_manipulate import cassandra_delete_proc
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
host = 'localhost'
port = 9160
keyspace = 'city'
con = cql.connect (host,port,keyspace,cql_version='3.0.0')
print ("*** check *** bbb ***")
cursor = con.cursor()
#
cassandra_delete_proc (cursor,key_in)
#
cursor.close()
con.close()
#
#
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
