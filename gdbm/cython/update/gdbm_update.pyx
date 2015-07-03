# -*- coding: utf-8 -*-
#
#	gdbm_update.py
#
#					Jul/03/2015
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
db_name = sys.argv[1]
print (db_name)
key_in = sys.argv[2]
population_in = int (sys.argv[3])
print ("%s\t%d" % (key_in, population_in))
#
dd = dbm.open (db_name,"c")
dbm_update_proc	(dd,key_in,population_in)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
