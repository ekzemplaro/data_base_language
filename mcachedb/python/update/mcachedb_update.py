#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mcachedb_update.py
#
#					Jun/08/2011
#
import	sys
import	string
import json
#
import datetime
import memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_update_proc,mcache_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
mc = memcache.Client(['localhost:21201'])
#
mcache_update_proc (mc,id_in,population_in)
#
keys = {'t1521','t1522','t1523',
	't1524','t1525','t1526',
	't1527','t1528','t1529',
	't1530','t1531','t1532'}
#
for key in keys:
	mcache_display_proc (mc,key)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
