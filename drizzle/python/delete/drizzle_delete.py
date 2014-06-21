#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	drizzle_delete.py
#
#						Jul/06/2012
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from drizzle_manipulate import drizzle_delete_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
id_in = sys.argv[1]
print ("%s" % id_in)
#
db_name = "city"
drizzle_delete_proc (db_name,id_in)
#
print	("*** 終了 ***")
# ------------------------------------------------------------------

