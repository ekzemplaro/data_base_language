#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	gdbm_read.py
#
#					Jun/11/2015
import	sys
import json
#import anydbm
import dbm
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_to_dict_proc
from text_manipulate import dict_display_proc
# -------------------------------------------------------------
print ("*** 開始 ***")
db_name = sys.argv[1]
# dd = anydbm.open (db_name,"c")
dd = dbm.open (db_name,"c")
#
dict_aa = dbm_to_dict_proc (dd)
#
dd.close ()
#
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# -------------------------------------------------------------
