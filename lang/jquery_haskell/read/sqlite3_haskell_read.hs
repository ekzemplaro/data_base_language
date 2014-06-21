#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	jquery_sqlite3_read.py
#
#						Mar/15/2010
#
#
import sqlite3
import sys
import json
#
sys.path.append ("/var/www/uchida/data_base/python_common")
from sql_to_json import sql_to_json_proc
#
conn = sqlite3.connect ("/var/tmp/sqlite3/cities.db")
conn.text_factory=str
#
sql_to_json_proc (conn);
#
conn.close ()
#
#
