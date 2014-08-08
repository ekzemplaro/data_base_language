#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	berkeley_delete.py
#
#					Jul/30/2014
import	sys
from bsddb3 import db
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_disp_proc,dbm_delete_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
db_name = "/var/tmp/berkeley/cities.db";
adb = db.DB ()
adb.open (db_name)
dbm_delete_proc	(adb,id_in)
dbm_disp_proc (adb)
#
adb.close ()
#
print	("*** 終了 ***")
# -------------------------------------------------------------
