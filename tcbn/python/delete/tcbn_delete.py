#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	tcbn_delete.py
#
#						Jun/27/2012
#
import	sys
import	json
import	string
import	pytc
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_delete_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
file_tcbn = sys.argv[1]
id_in = sys.argv[2]
print ("%s" % id_in)
#
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
#
dbm_delete_proc	(db,id_in)
#
db.close ()
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
