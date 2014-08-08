#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mysql_read.py
#					Jul/25/2014
#
import sys
import mysql.connector
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from sql_manipulate import sql_to_dict_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
conn = mysql.connector.connect (host="host_mysql", \
			user="scott", passwd="tiger", db="city")
#
cursor = conn.cursor ()
#
dict_aa = sql_to_dict_proc (cursor)
#
conn.close ()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
