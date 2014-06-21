#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mcachedb_delete.py
#
#					Jun/08/2011
#
import	sys
import	string
import json
#
import memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_delete_proc,mcache_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
mc = memcache.Client(['localhost:21201'])
#
mcache_delete_proc (mc,id_in)
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
