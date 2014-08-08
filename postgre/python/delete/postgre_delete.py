#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	delete/postgre_delete.py
#
#				Jul/29/2014
#
# --------------------------------------------------------
import sys
import postgresql
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_delete_string_gen_proc
#
# --------------------------------------------------------
print ("*** 開始 ***")
key_in = sys.argv[1]
print ("%s" % key_in)
#
db = postgresql.open("pq://scott:tiger@localhost/city")
#
sql_str = sql_delete_string_gen_proc (key_in)
#
ps = db.prepare(sql_str)
print (ps ())
#
ps.close ()
db.close ()
#
print ("*** 終了 ***")
#
# --------------------------------------------------------
