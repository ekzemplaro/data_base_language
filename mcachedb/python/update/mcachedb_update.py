#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mcachedb_update.py
#
#					Oct/07/2014
#
import	sys
#
import memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_update_proc,mcache_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
mc = memcache.Client(['localhost:21201'])
#
mcache_update_proc (mc,key_in,population_in)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
