#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mcachedb_delete.py
#
#					Jul/29/2014
#
import	sys
import	string
import json
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
mc = memcache.Client(['localhost:21201'])
#
mcache_delete_proc (mc,id_in)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
