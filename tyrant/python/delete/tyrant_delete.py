#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	tyrant_delete.py
#
#					Oct/07/2014
#
import	sys
#
import memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_delete_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
mc = memcache.Client(['localhost:1978'])
#
mcache_delete_proc (mc,id_in)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
