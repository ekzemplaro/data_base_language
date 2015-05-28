#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	derby_delete.py
#
#						May/26/2015
#
import	sys
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from derby_manipulate import derby_delete_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
db_name = "city_aaa"
derby_delete_proc (db_name,id_in)
#
print	("*** 終了 ***")
# ------------------------------------------------------------------

