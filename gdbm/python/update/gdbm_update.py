#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	gdbm_update.py
#
#					Jul/30/2014
import	sys
import	string
import	dbm
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from dbm_manipulate import dbm_update_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
db_name = "/var/tmp/gdbm/cities.pag";
dd = dbm.open (db_name,"c")
dbm_update_proc	(dd,key_in,population_in)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
