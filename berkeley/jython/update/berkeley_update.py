#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_update.py
#
#					Jul/09/2010
import	sys
import json
from bsddb import db
import string
#
sys.path.append ('/var/www/uchida/data_base/common/python_common')
from text_manipulate import hash_update_proc
from dbm_manipulate import dbm_disp_proc,dbm_update_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = string.atoi (sys.argv[1])
population_in = string.atoi (sys.argv[2])
print ("%d\t%d" % (id_in, population_in))
#
db_name = "/var/tmp/berkeley/cities.db";
adb = db.DB ()
adb.open (db_name)
dbm_update_proc	(adb,id_in,population_in)
dbm_disp_proc (adb)
#
adb.close ()
#
print	("*** 終了 ***")
# -------------------------------------------------------------
