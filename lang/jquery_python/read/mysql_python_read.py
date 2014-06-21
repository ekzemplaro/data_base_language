#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mysql_python_read.py
#
#						May/30/2012
#
# ----------------------------------------------------------------
import sys
import json
import MySQLdb
#
sys.path.append ("/var/www/data_base/common/python_common")
from sql_manipulate import sql_to_dict_proc
from mysql_utf8 import mysql_utf8_proc
#
#conn = MySQLdb.connect (host="localhost", \
conn = MySQLdb.connect (host="host_mysql", \
	user="scott", passwd="tiger", \
	db="city")
#
cursor = conn.cursor ()
mysql_utf8_proc (cursor)
#
dict_aa = sql_to_dict_proc (cursor)
#
conn.close ()
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
#	
