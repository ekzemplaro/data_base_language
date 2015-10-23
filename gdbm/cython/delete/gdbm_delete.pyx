# -*- coding: utf-8 -*-
#
#	gdbm_delete.pyx
#
#					Jul/03/2015
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
db_name = sys.argv[1]
print (db_name)
key_in = sys.argv[2]
print ("%s" % key_in)
#
dd = dbm.open (db_name,"c")
dbm_delete_proc	(dd,key_in)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
