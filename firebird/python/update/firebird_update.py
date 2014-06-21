#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_update.py
#
#				May/30/2012
#
# --------------------------------------------------------
import sys
import string
import kinterbasdb
from time import localtime,strftime
import datetime
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from sql_manipulate import sql_display_proc,sql_update_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
		user="sysdba", password="tiger")
#		user="sysdba", password="masterkey",charset="utf-8")
#
cursor = conn.cursor ()
#
sql_update_proc	(cursor,id_in,population_in)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print	"%s" %  datetime.datetime.now ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
