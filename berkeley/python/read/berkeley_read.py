#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_read.py
#
#					Oct/25/2010
import	sys
import json
from bsddb import db
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_disp_proc
# -------------------------------------------------------------
print	("*** 開始 ***")
#
print db.DB_VERSION_STRING + "\n"
db_name = sys.argv[1]
#
#dd = anydbm.open (db_name,"c")
adb = db.DB ()
adb.open (db_name,dbtype=db.DB_HASH)
#
dbm_disp_proc (adb)
adb.close ()
#
print	("*** 終了 ***")
#
# -------------------------------------------------------------
