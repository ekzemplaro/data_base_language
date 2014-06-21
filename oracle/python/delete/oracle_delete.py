#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	oracle_delete.py
#
#					May/31/2011
#
# --------------------------------------------------------
import	sys
import	cx_Oracle
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
#conn = cx_Oracle.connect ("system/hello9@spn109:1521/orcl")
conn = cx_Oracle.connect (u"scott/tiger@spn109:1521/xe")
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,id_in)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
