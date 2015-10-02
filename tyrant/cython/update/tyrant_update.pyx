# -*- coding: utf-8 -*-
#
#	tyrant_update.pyx
#
#					Sep/14/2015
#
import	sys
import	string
import	json
#
import datetime
import memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_update_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
mc = memcache.Client(['host_ubuntu:1978'])
#
mcache_update_proc (mc,id_in,population_in)
#
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
