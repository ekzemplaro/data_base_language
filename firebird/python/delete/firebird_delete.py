#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_delete.py
#
#				May/30/2012
#
# --------------------------------------------------------
import sys
import string
import kinterbasdb
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from sql_manipulate import sql_display_proc,sql_delete_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
		user="sysdba", password="tiger")
#		user="sysdba", password="masterkey",charset="utf-8")
#
cursor = conn.cursor ()
#
sql_delete_proc	(cursor,id_in)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
