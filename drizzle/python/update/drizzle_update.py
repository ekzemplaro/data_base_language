#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	drizzle_update.py
#
#						Jul/06/2012
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	string
#
sys.path.append ('/var/www/data_base/common/python_common')
from drizzle_manipulate import drizzle_update_proc
# ------------------------------------------------------------------
print	("*** 開始 ***")
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
db_name = "city"
drizzle_update_proc (db_name,id_in,population_in)
#
print	("*** 終了 ***")
# ------------------------------------------------------------------

