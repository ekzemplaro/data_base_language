#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_python_read.py
#
#						Jun/23/2015
#
#
# ---------------------------------------------------------------------
import sys
import json
import pymssql
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from sql_manipulate import sql_to_dict_proc
#
#
# ---------------------------------------------------------------------
conn = pymssql.connect \
	(host='host_mssql',user='sa',password='scott_tiger',database='city')
cursor = conn.cursor(as_dict=True)
#
dict_aa = sql_to_dict_proc (cursor);
cursor.close ()
conn.close ()
#
out_str = json.dumps (dict_aa)
#
print ("Content-type: text/json; charset=UTF-8\n\n")
#
print (out_str)
# ---------------------------------------------------------------------
