# -*- coding: utf-8 -*-
#
#	read/sqlite3_read.pyx
#					Oct/27/2011
#
# ------------------------------------------------------------------
import	sys
import sqlite3
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc
#
# ------------------------------------------------------------------
print ("*** 開始 ***")
#
file_in=sys.argv[1]
conn = sqlite3.connect (file_in)
conn.text_factory=str
#
cursor = conn.cursor ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
#
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
