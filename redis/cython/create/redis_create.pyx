# -*- coding: utf-8 -*-
#
#	create/redis_create.pyx
#
#					May/31/2012
#
import sys
import json
import redis
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_display_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
#rr = redis.Redis(host='localhost', port=6379, db=0)
rr = redis.Redis(host='host_dbase', port=6379, db=0)

#rr.flush_all()
#
rr.set('t1851', '{"name":"福井","population":29346,"date_mod":"1925-2-24"}')
rr.set('t1852', '{"name":"敦賀","population":41279,"date_mod":"1925-5-8"}')
rr.set('t1853', '{"name":"小浜","population":57614,"date_mod":"1925-9-24"}')
rr.set('t1854', '{"name":"大野","population":51938,"date_mod":"1925-6-11"}')
rr.set('t1855', '{"name":"勝山","population":42813,"date_mod":"1925-8-14"}')
rr.set('t1856', '{"name":"鯖江","population":32657,"date_mod":"1925-9-4"}')
rr.set('t1857', '{"name":"あわら","population":30670,"date_mod":"1925-10-7"}')
rr.set('t1858', '{"name":"越前","population":58651,"date_mod":"1925-11-5"}')
rr.set('t1859', '{"name":"坂井","population":27642,"date_mod":"1925-11-14"}')
#
keys = {'t1851','t1852','t1853',
	't1854','t1855','t1856',
	't1857','t1858','t1859'}
#
for key in keys:
	mcache_display_proc (rr,key)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
