#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	berkeley_update.py
#
#					Jun/11/2015
import	sys
import json
from bsddb3 import db
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_update_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
db_name = sys.argv[1]
key_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (key_in, population_in))
#
adb = db.DB ()
adb.open (db_name)
dbm_update_proc	(adb,key_in,population_in)
#
adb.close ()
#
print	("*** 終了 ***")
# -------------------------------------------------------------
