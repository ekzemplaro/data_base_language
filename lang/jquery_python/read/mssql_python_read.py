#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_python_read.py
#
#						Nov/19/2015
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
server_mssql = 'host_mssql\EG'
user_mssql = 'sa'
password_mssql = 'Tiger123'
#
conn = pymssql.connect \
	(host=server_mssql,user=user_mssql,password=password_mssql,database='city')
#
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
