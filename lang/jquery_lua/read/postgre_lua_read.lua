#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	postgre_python_read.py
#
#						Apr/21/2010
#
#	cp -p jquery_sqlite3_read.py /usr/lib/cgi-bin/data_base/python
#
import sys
import json
import pgdb
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from sql_to_json import sql_to_json_proc
#
hostname="localhost"
conn = pgdb.connect (host=hostname,database="city", \
		user="uchida", password="hello9")
#
sql_to_json_proc (conn);
conn.close ()
#
#
