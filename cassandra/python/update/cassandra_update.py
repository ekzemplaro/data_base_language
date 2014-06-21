#!/usr/bin/python
# -*- coding:utf-8 -*-
#
#	cassandra_update.py
#						Sep/06/2013
#
# ---------------------------------------------------------------
import	sys
import	string
import	datetime
import	cql
#
sys.path.append ('/var/www/data_base/common/python_common')
from cassandra_manipulate import cassandra_update_proc
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
host = 'localhost'
port = 9160
keyspace = 'city'
con = cql.connect (host,port,keyspace,cql_version='3.0.0')
print ("*** check *** bbb ***")
cursor = con.cursor()
#
cassandra_update_proc (cursor,key_in,population_in)
#
cursor.close()
con.close()
#
print ("*** 終了 ***")
# ---------------------------------------------------------------
