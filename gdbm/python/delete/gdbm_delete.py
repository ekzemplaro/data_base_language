#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	gdbm_delete.py
#
#					Jul/30/2014
import	sys
import	string
import	dbm
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from dbm_manipulate import dbm_delete_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
db_name = "/var/tmp/gdbm/cities.pag";
dd = dbm.open (db_name,"c")
dbm_delete_proc	(dd,key_in)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
