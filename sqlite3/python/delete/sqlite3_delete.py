#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	update/sqlite_delete.py
#
#					Sep/06/2016
#
# --------------------------------------------------------
import	sys
import sqlite3
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_delete_proc
#
# --------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
file_in = sys.argv[1]
key_in = sys.argv[2]
print ("%s" % key_in)
#
conn = sqlite3.connect (file_in)
conn.text_factory=str
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,key_in)
#
conn.commit ()
#
cursor.close ()
conn.close ()
#
sys.stderr.write ("*** 終了 ***\n")
#
# --------------------------------------------------------
