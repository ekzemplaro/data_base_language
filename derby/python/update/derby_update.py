#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	derby_update.py
#
#						May/26/2015
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from derby_manipulate import derby_update_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
db_name = "city_aaa"
derby_update_proc (db_name,key_in,population_in)
#
print	("*** 終了 ***")
# ------------------------------------------------------------------

