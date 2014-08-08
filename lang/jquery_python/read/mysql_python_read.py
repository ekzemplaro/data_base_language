#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mysql_python_read.py
#
#						Jul/25/2014
#
# ----------------------------------------------------------------
import sys
import json
import mysql.connector
#
sys.path.append ("/var/www/data_base/common/python_common")
from sql_manipulate import sql_to_dict_proc
# ----------------------------------------------------------------
#
conn = mysql.connector.connect (host="host_mysql", \
	user="scott", passwd="tiger", \
	db="city")
#
cursor = conn.cursor ()
#
dict_aa = sql_to_dict_proc (cursor)
#
conn.close ()
#
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print	(str_aa)
#
# ----------------------------------------------------------------
