#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	maria_update.py
#
#					Sep/16/2013
#
# --------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	string
import MySQLdb
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_update_proc
from mysql_utf8 import mysql_utf8_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
#
conn = MySQLdb.connect (host="localhost",db="city", \
			user="scott", passwd="tiger")
#
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
#
sql_update_proc	(cursor,id_in,population_in)
conn.commit ()
#
sql_display_proc (cursor)
#
cursor.close ()
conn.close ()
print ("*** 終了 ***")
#
# --------------------------------------------------------
