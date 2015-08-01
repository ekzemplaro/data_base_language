#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mcachedb_delete.py
#
#					Feb/02/2015
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
key_in = sys.argv[1]
print ("%s" % key_in)
#
mc = memcache.Client(['ubuntu_1504:21201'])
#
mcache_delete_proc (mc,key_in)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
