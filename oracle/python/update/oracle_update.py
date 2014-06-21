#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	oracle_update.py
#
#					May/31/2011
#
#	to_date ('2009/7/23 16:20:15','YYYY/MM/DD HH24:MI:SS')
# --------------------------------------------------------
import	sys
import	cx_Oracle
import	string
import	datetime
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_display_proc,sql_update_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
#conn = cx_Oracle.connect ("system/hello9@spn109:1521/orcl")
conn = cx_Oracle.connect (u"scott/tiger@spn109:1521/xe")
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
