#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_delete.py
#
#					Nov/18/2015
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
server_mssql = 'host_mssql\EG'
user_mssql = 'sa'
password_mssql = 'Tiger123'
#
conn = pymssql.connect \
	(host=server_mssql,user=user_mssql,password=password_mssql,database='city')
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
