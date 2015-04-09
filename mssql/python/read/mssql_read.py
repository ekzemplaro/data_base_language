#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_read.py
#
#						Mar/10/2015
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
server = 'host_mssql'
#
try:
	conn = pymssql.connect \
		(host=server,user='sa',password='scott_tiger',database='city')
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
