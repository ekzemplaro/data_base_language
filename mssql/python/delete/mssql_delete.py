#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_delete.py
#
#					Aug/30/2017
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
server_mssql = 'localhost'
user_mssql = 'sa'
password_mssql = 'Sql12345'
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
