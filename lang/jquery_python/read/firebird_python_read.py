#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_python_read.py
#
#						May/30/2012
#
#
import sys
import json
import kinterbasdb
#
# -------------------------------------------------------------------
sys.path.append ("/var/www/data_base/common/python_common")
#
from sql_manipulate import sql_to_dict_proc
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
		user="SYSDBA", password="tiger")
#		user="SYSDBA", password="tiger",charset="utf-8")
#
cursor = conn.cursor ()
#
dict_aa = sql_to_dict_proc (cursor)
cursor.close ()
conn.close ()
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
#
