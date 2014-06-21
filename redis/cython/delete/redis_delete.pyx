#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	redis_delete.pyx
#
#					May/31/2012
#
import	sys
import	string
import	json
#
import	datetime
import	redis
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_delete_proc,mcache_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
#rr = redis.Redis(host='localhost', port=6379, db=0)
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
mcache_delete_proc (rr,id_in)
#
keys = {'t1851','t1852','t1853',
	't1854','t1855','t1856',
	't1857','t1858','t1859'}
#
for key in keys:
	mcache_display_proc (rr,key)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
