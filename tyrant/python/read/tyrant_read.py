#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	tyrant_read.py
#
#					Jun/20/2011
#
import	sys
import json
#
import memcache
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
mc = memcache.Client(['localhost:1978'])
#
keys = {'t4761','t4762','t4763',
	't4764','t4765','t4766',
	't4767','t4768','t4769'}
#
for key in keys:
	mcache_display_proc (mc,key)
#
print ("*** 終了 ***")
#
