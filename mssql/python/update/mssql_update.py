#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_update.py
#
#					Nov/18/2015
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
server_mssql = 'host_mssql\EG'
user_mssql = 'sa'
password_mssql = 'Tiger123'
#
conn = pymssql.connect \
	(host=server_mssql,user=user_mssql,password=password_mssql,database='city')
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
