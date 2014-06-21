#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	update/sqlite_update.py
#
#					Oct/27/2011
#
# --------------------------------------------------------
import	sys
import	sqlite3
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_update_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
file_in = sys.argv[1]
id_in = sys.argv[2]
population_in = string.atoi (sys.argv[3])
print ("%s\t%d" % (id_in, population_in))
#
conn = sqlite3.connect (file_in)
conn.text_factory=str
#
cursor = conn.cursor ()
#
sql_update_proc	(cursor,id_in,population_in)
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
