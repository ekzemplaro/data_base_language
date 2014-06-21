#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	tcbn_read.py
#
#						Jun/27/2012
#
import	sys
import	json
import	string
import	pytc
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from dbm_manipulate import dbm_to_dict_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
file_tcbn = sys.argv[1]
#
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
dict_aa = dbm_to_dict_proc (db)
db.close ()
dict_display_proc (dict_aa)
print ("*** 終了 ***")
#
# ------------------------------------------------------------
