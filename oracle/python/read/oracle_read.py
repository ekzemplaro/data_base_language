#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	oracle_read.py
#
#					Aug/07/2015
# --------------------------------------------------------------
import	sys
import	locale
import	cx_Oracle
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import	sql_display_proc
#
print ("*** 開始 ***")
locale.setlocale(locale.LC_ALL,('ja_JP','utf-8'))
#
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = user + "/" + password + "@" + host + ":1521/xe"
conn = cx_Oracle.connect (str_connect)
#
cursor = conn.cursor ()

sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
#
print ("*** 終了 ***")
#
# --------------------------------------------------------------
