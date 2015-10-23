# -*- coding: utf-8 -*-
#
#	maria_read.pyx
#					Mar/10/2015
#
import sys
import mysql.connector
#
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
conn = mysql.connector.connect (host="localhost", \
			user="scott", passwd="tiger", db="city")
#
cursor = conn.cursor ()
#
sql_display_proc (cursor)
#
conn.close ()
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
