#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	oracle_delete.py
#
#					Aug/06/2015
#
# --------------------------------------------------------
import	sys
import	cx_Oracle
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = user + "/" + password + "@" + host + ":1521/xe"
conn = cx_Oracle.connect (str_connect)
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,id_in)
#
cursor.close ()
conn.commit ()
conn.close ()
#
print ("*** 終了 ***")
#
# --------------------------------------------------------
