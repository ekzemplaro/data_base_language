#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_read.py
#					Nov/14/2011
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
cnx = mysql.connector.connect(user='scott', password='tiger', \
                              host='localhost',database='city')
#
cursor = cnx.cursor ()
#
dict_aa = sql_to_dict_proc (cursor)
#
cnx.close ()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
