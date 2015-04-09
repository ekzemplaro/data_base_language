#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_update.py
#
#					Mar/10/2015
#
#
# --------------------------------------------------------
import	sys
import	string
import pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_update_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
#
conn = pymssql.connect \
	(host='host_mssql',user='sa',password='scott_tiger',database='city')
#
cursor = conn.cursor ()
#
sql_update_proc	(cursor,key_in,population_in)
conn.commit ()
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
