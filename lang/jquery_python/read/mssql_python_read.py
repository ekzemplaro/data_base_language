#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_python_read.py
#
#						Mar/10/2015
#
#
# ---------------------------------------------------------------------
import sys
import json
import pymssql
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from sql_to_json import sql_to_json_proc
#
#
# ---------------------------------------------------------------------
conn = pymssql.connect \
	(host='host_mssql',user='sa',password='scott_tiger',database='city')
#
sql_to_json_proc (conn);
conn.close ()
#
# ---------------------------------------------------------------------
