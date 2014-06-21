#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	jquery_mysql_read.py
#
#						Nov/16/2010
#
# ----------------------------------------------------------------
import sys
import json
import MySQLdb
#
sys.path.append ("/var/www/uchida/data_base/python_common")
from sql_to_json import sql_to_json_proc
from mysql_utf8 import mysql_utf8_proc
#
#conn = MySQLdb.connect (host="localhost", \
conn = MySQLdb.connect (host="host_mysql", \
	user="uchida", passwd="hello9", \
	db="city")
#
cursor = conn.cursor ()
mysql_utf8_proc (cursor)
#
sql_to_json_proc (conn);
#
conn.close ()
#
#	
