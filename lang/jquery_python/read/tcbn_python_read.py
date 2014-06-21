#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	tcbn_python_read.py
#
#						Jun/27/2012
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
import	pytc
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_to_dict_proc
# ---------------------------------------------------------------------
#
file_tcbn = "/var/tmp/tokyo_cabinet/cities.tcb"
#
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
dict_aa = dbm_to_dict_proc (db)
db.close ()
#
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
