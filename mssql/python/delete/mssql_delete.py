#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_delete.py
#
#					Mar/10/2015
#
#
# --------------------------------------------------------
import	sys
import	pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
key_in = sys.argv[1]
print ("%s" % key_in)
#
#
conn = pymssql.connect \
	(host='host_mssql',user='sa',password='scott_tiger',database='city')
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,key_in)
conn.commit ()
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
