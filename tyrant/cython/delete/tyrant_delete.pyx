# -*- coding: utf-8 -*-
#
#	tyrant_delete.pyx
#
#					Sep/14/2015
#
import	sys
import	string
import	json
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
mc = memcache.Client(['host_ubuntu:1978'])
#
mcache_delete_proc (mc,id_in)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
