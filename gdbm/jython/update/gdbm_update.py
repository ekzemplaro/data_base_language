#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	gdbm_update.py
#
#					Jul/09/2010
import	sys
import	string
import anydbm
#
sys.path.append ('/var/www/uchida/data_base/common/python_common')
#
from dbm_manipulate import dbm_disp_proc,dbm_update_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = string.atoi (sys.argv[1])
population_in = string.atoi (sys.argv[2])
print ("%d\t%d" % (id_in, population_in))
#
db_name = "/var/tmp/gdbm/cities.pag";
dd = anydbm.open (db_name,"c")
dbm_update_proc	(dd,id_in,population_in)
dbm_disp_proc (dd)
#
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
