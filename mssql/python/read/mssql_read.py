#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_read.py
#
#						Aug/30/2017
#
#
# ----------------------------------------------------------------
import	sys
import	pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_to_dict_proc
from text_manipulate import dict_display_proc
# ----------------------------------------------------------------
#
#
print ("*** 開始 ***")
#
server_mssql = 'localhost'
user_mssql = 'sa'
password_mssql = 'Sql12345'
#
try:
	conn = pymssql.connect \
		(host=server_mssql,user=user_mssql,password=password_mssql,database='city')
	cursor = conn.cursor(as_dict=True)
#
	dict_aa=sql_to_dict_proc (cursor)
#
	cursor.close ()
	conn.close ()
#
	dict_display_proc (dict_aa)
#
except Exception as ee:
		sys.stderr.write ("*** error *** mssql_read.py ***\n")
		sys.stderr.write (str (ee))
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
