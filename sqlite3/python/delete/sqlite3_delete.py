#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	update/sqlite_delete.py
#
#					Oct/27/2011
#
# --------------------------------------------------------
import	sys
import sqlite3
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)
#
conn = sqlite3.connect (file_in)
conn.text_factory=str
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,id_in)
#
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
