#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	berkeley_delete.py
#
#					Aug/23/2010
import	sys
#import json
from bsddb import db
import string
#
sys.path.append ('/var/www/uchida/data_base/common/python_common')
from text_manipulate import hash_update_proc
#from dbm_manipulate import dbm_disp_proc,dbm_delete_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = string.atoi (sys.argv[1])
print ("%d" % id_in)
#
db_name = "/var/tmp/berkeley/cities.db";
adb = db.DB ()
adb.open (db_name)
#
key_id = str (id_in) 
del adb[key_id]
#dbm_delete_proc	(adb,id_in)
#dbm_disp_proc (adb)
#
adb.close ()
#
print	("*** 終了 ***")
# -------------------------------------------------------------
