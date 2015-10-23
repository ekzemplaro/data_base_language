#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_delete.py
#
#					Jul/03/2015
import	sys
from bsddb3 import db
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_delete_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
db_name = sys.argv[1]
print (db_name)
key_in = sys.argv[2]
print ("%s" % key_in)
#
adb = db.DB ()
adb.open (db_name)
dbm_delete_proc	(adb,key_in)
#
adb.close ()
#
print	("*** 終了 ***")
# -------------------------------------------------------------
