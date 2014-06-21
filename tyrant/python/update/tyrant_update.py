#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	tyrant_update.py
#
#					Jun/20/2011
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
mc = memcache.Client(['localhost:1978'])
#
mcache_update_proc (mc,id_in,population_in)
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
# ------------------------------------------------------------
