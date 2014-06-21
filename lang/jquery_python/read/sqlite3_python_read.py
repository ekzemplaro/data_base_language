#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	jquery_sqlite3_read.py
#
#						May/30/2012
#
# ---------------------------------------------------------------------
#
import sqlite3
import sys
import json
#
sys.path.append ("/var/www/data_base/common/python_common")
from sql_manipulate import sql_to_dict_proc
#
conn = sqlite3.connect ("/var/tmp/sqlite3/cities.db")
conn.text_factory=str
#
cursor = conn.cursor ()
#
dict_aa = sql_to_dict_proc (cursor)
conn.close ()
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
#
#
