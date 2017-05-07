#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	maria_read.py
#					Apr/30/2017
#
import sys
#
import mysql.connector
#
#
sys.path.append ('../../../common/python_common')
from text_manipulate import dict_display_proc
from sql_manipulate import sql_to_dict_proc
#
# ----------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
host_aa='localhost'
data_base = 'city'
user_aa ='scott'
password_aa = 'tiger123'
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
sys.stderr.write ("*** 終了 ***\n")
#
# ----------------------------------------------------------------
