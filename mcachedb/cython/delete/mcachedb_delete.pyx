# -*- coding: utf-8 -*-
#
#	mcachedb_delete.pyx
#
#					Sep/14/2015
#
import	sys
import	string
#
import	memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_delete_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
mc = memcache.Client(['host_ubuntu:21201'])
#
mcache_delete_proc (mc,key_in)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
