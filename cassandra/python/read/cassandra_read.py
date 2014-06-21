#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	cassandra_read.py
#						Sep/04/2013
#
# ---------------------------------------------------------------
import	sys
import	cql

sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from cassandra_manipulate import cassandra_to_dict_proc
# --------------------------------------------------------------------
print ("*** 開始 ***")
#
host = 'localhost'
port = 9160
keyspace = 'city'
con = cql.connect (host,port,keyspace,cql_version='3.0.0')
print ("*** check *** bbb ***")
cursor = con.cursor()
#
dict_aa = cassandra_to_dict_proc (cursor)
#
cursor.close()
con.close()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# --------------------------------------------------------------------

