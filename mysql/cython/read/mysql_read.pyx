# -*- coding: utf-8 -*-
#
#	mysql_read.pyx
#					Oct/28/2011
#
import sys
import MySQLdb
#
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc
from mysql_utf8 import mysql_utf8_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
conn = MySQLdb.connect (host="host_mysql", \
			user="scott", passwd="tiger", db="city")
#
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
sql_display_proc (cursor)
#
conn.close ()
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
