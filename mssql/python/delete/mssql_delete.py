#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_delete.py
#
#					Oct/01/2013
#
#
# --------------------------------------------------------
import	sys
import	string
import pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
#
conn = pymssql.connect \
	(host='host_mssql',user='sa',password='scott_tiger',database='city')
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
