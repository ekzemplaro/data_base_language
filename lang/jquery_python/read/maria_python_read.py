#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	maria_python_read.py
#
#						Jun/24/2015
#
# ----------------------------------------------------------------
import sys
import json
import mysql.connector
#
sys.path.append ("/var/www/data_base/common/python_common")
from sql_manipulate import sql_to_dict_proc
#
#
conn = mysql.connector.connect (host="localhost", \
	user="scott", passwd="tiger", \
	db="city")
#
cursor = conn.cursor (dictionary=True)
#
dict_aa = sql_to_dict_proc (cursor)
#
conn.close ()
#
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print (str_aa)
#	
