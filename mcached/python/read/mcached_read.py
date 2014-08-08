#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mcached_read.py
#
#					Jul/29/2014
#
import	sys
import json
#
import memcache
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
mc = memcache.Client(['localhost:11211'])
#
keys = {'t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739'}
#
for key in keys:
	mcache_display_proc (mc,key)
#
print ("*** 終了 ***")
#
