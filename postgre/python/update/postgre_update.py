#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	update/postgre_update.py
#
#				Jul/29/2014
#
# --------------------------------------------------------
import sys
import string
import postgresql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_update_string_gen_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
#
db = postgresql.open("pq://scott:tiger@localhost/city")
ps = db.prepare("SELECT version()")
print (ps ())
#
sql_str=sql_update_string_gen_proc (key_in,population_in)
#
ps = db.prepare(sql_str)
print (ps ())
#
db.close ()
ps.close ()
#
print ("*** 終了 ***")
#
# --------------------------------------------------------
