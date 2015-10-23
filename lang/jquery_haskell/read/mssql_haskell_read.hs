#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_python_read.py
#
#						Apr/28/2010
#
#
import sys
import json
import pymssql
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from sql_to_json import sql_to_json_proc
#
#
conn = pymssql.connect \
	(host='cdbd025\SQLEXPRESS',user='sa',password='hello9',database='city')
#
sql_to_json_proc (conn);
conn.close ()
#
