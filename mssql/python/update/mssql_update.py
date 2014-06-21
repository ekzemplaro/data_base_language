#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_update.py
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
from sql_manipulate import sql_display_proc,sql_update_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
#
conn = pymssql.connect \
	(host='host_mssql',user='sa',password='scott_tiger',database='city')
#
cursor = conn.cursor ()
#
sql_update_proc	(cursor,id_in,population_in)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
