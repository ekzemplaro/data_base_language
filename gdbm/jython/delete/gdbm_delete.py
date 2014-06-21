#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	gdbm_delete.py
#
#					Oct/07/2010
import	sys
import	string
#import anydbm
import gnudbm
#
sys.path.append ('/var/www/uchida/data_base/common/python_common')
#
#from dbm_manipulate import dbm_disp_proc,dbm_delete_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = string.atoi (sys.argv[1])
print ("%d" % id_in)
#
db_name = "/var/tmp/gdbm/cities.pag";
#dd = anydbm.open (db_name,"c")
dd = gdbm.open (db_name,"c")
#
#dbm_delete_proc	(dd,id_in)
key_id = str (id_id)
del dd[key_id]
#
#dbm_disp_proc (dd)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
