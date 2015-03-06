#! /usr/bin/python2.7
# -*- coding: utf-8 -*-
#
#	mssql_read.py
#
#						Oct/01/2013
#
#
# ----------------------------------------------------------------
import	sys
import	pymssql
#
sys.path.append ('/var/www/data_base/common/python_common')
from to_utf8 import to_utf8_proc
# ----------------------------------------------------------------
def	sql_display_procx	(cursor):
	print ("*** display start *** aaa")
	sql_str=u"select id, name, population, date_Mod from cities order by ID"
	cursor.execute (sql_str)
	rows = cursor.fetchall ()
	for row in rows:
		print row[0],row[1],row[2],row[3]
#		print row[0],to_utf8_proc (row[1]),row[2],row[3]
#		print (row[0],row[1],row[2],row[3])
	print ("*** display end ***")
#
# ----------------------------------------------------------------
#
from sql_manipulate import sql_display_proc
#
print ("*** 開始 ***")
#
server = 'host_mssql'
conn = pymssql.connect \
	(host=server,user='sa',password='scott_tiger',database='city')
cursor = conn.cursor()
#
sql_display_procx (cursor)
#sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
