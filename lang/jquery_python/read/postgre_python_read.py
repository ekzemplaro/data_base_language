#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	postgre_python_read.py
#
#						Sep/06/2016
#
# ----------------------------------------------------------------------
import sys
import json
import psycopg2
import psycopg2.extras
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from sql_manipulate import sql_to_dict_proc
#
#
conn = psycopg2.connect("dbname=city user=scott password=tiger")
cur = conn.cursor(cursor_factory=psycopg2.extras.DictCursor)
#
dict_aa = sql_to_dict_proc (cur)
cur.close()
conn.close()
#
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print	(str_aa)
#
