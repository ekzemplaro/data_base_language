#!/usr/bin/python
# -*- coding: utf-8 -*-
#
#	create/redis_create.py
#
#					Jul/29/2014
#
import sys
import json
import redis
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_to_dict_proc
from text_manipulate import dict_display_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
#rr = redis.Redis(host='localhost', port=6379, db=0)
rr = redis.Redis(host='host_dbase', port=6379, db=0)

#rr.flush_all()
#
rr.set('t1851', '{"name":"福井","population":28451,"date_mod":"2003-7-14"}')
rr.set('t1852', '{"name":"敦賀","population":41289,"date_mod":"2003-6-18"}')
rr.set('t1853', '{"name":"小浜","population":53914,"date_mod":"2003-9-2"}')
rr.set('t1854', '{"name":"大野","population":51638,"date_mod":"2003-2-21"}')
rr.set('t1855', '{"name":"勝山","population":42513,"date_mod":"2003-3-14"}')
rr.set('t1856', '{"name":"鯖江","population":32697,"date_mod":"2003-9-4"}')
rr.set('t1857', '{"name":"あわら","population":38641,"date_mod":"2003-10-7"}')
rr.set('t1858', '{"name":"越前","population":58694,"date_mod":"2003-8-5"}')
rr.set('t1859', '{"name":"坂井","population":27649,"date_mod":"2003-11-14"}')
#
keys = {'t1851','t1852','t1853',
	't1854','t1855','t1856',
	't1857','t1858','t1859'}
#
#dict_aa = mcache_to_dict_proc (rr,keys)
#dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
