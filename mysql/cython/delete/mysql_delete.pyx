#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mysql_delete.py
#
#					Oct/27/2011
#
# --------------------------------------------------------
import	sys
import	MySQLdb
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_delete_proc
from mysql_utf8 import mysql_utf8_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
#
conn = MySQLdb.connect (host="host_mysql",db="city", \
			user="scott", passwd="tiger")
#
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
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
