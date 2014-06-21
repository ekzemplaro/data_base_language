# -*- coding: utf-8 -*-
#
#	gdbm_delete.pyx
#
#					Nov/03/2011
import	sys
import	string
import anydbm
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from dbm_manipulate import dbm_disp_proc,dbm_delete_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
db_name = "/var/tmp/gdbm/cities.pag";
dd = anydbm.open (db_name,"c")
dbm_delete_proc	(dd,id_in)
dbm_disp_proc (dd)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
