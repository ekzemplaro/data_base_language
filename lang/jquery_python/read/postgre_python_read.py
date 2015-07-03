#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	postgre_python_read.py
#
#						Jun/24/2015
#
# ----------------------------------------------------------------------
import sys
import json
import pgdb
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from sql_manipulate import sql_to_dict_proc
#
hostname="localhost"
conn = pgdb.connect (host=hostname,database="city", \
		user="scott", password="tiger")
#
#sql_to_json_proc (conn);
cursor = conn.cursor ()
dict_aa = sql_to_dict_proc (cursor)
conn.close ()
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
#
