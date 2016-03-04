#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	maria_read.py
#					Feb/18/2016
#
import sys
#
import mysql.connector
#
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from sql_manipulate import sql_to_dict_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
host_aa='localhost'
data_base = 'city'
user_aa ='scott'
password_aa = 'tiger'
conn = mysql.connector.connect(user=user_aa, password=password_aa, \
                              host=host_aa,database=data_base)
#
cursor = conn.cursor (dictionary=True)
#
dict_aa = sql_to_dict_proc (cursor)
#
cursor.close ()
conn.close ()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
