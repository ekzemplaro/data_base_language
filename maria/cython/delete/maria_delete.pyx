#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_delete.pyx
#
#					Mar/10/2015
#
# --------------------------------------------------------
import	sys
import	mysql.connector
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_delete_proc
from mysql_utf8 import mysql_utf8_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
#
conn = mysql.connector.connect (host="localhost",db="city", \
			user="scott", passwd="tiger")
#
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
#
sql_delete_proc	(cursor,key_in)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
