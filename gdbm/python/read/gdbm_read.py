#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	gdbm_read.py
#
#					Jul/30/2014
import	sys
import json
#import anydbm
import dbm
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_disp_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
db_name = "/var/tmp/gdbm/cities.pag";
# dd = anydbm.open (db_name,"c")
dd = dbm.open (db_name,"c")
#
dbm_disp_proc (dd)
dd.close ()
#
print ("*** 終了 ***")
# -------------------------------------------------------------
