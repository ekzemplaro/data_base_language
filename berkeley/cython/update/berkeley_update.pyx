# -*- coding: utf-8 -*-
#
#	berkeley_update.pyx
#
#					Nov/03/2011
import	sys
import json
from bsddb import db
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_disp_proc,dbm_update_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
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
