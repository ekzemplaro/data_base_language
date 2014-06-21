#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_read.py
#					Dec/26/2013
#
import sys
import MySQLdb
#
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from sql_manipulate import sql_to_dict_proc
from mysql_utf8 import mysql_utf8_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
conn = MySQLdb.connect (host="localhost", \
			user="scott", passwd="tiger", db="city")
#
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
dict_aa = sql_to_dict_proc (cursor)
#
conn.close ()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
