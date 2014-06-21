#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	redis_python_create.py
#
#						May/26/2011
# -------------------------------------------------------------------------
import sys
import json
import redis
#
#
#
# -------------------------------------------------------------------------
#
#rr = redis.Redis(host='localhost', port=6379, db=0)
rr = redis.Redis(host='host_dbase', port=6379, db=0)

#rr.flush_all()
#
rr.set('t1851', '{"name":"福井","population":87300,"date_mod":"2003-3-19"}')
rr.set('t1852', '{"name":"敦賀","population":16800,"date_mod":"2003-2-18"}')
rr.set('t1853', '{"name":"小浜","population":71300,"date_mod":"2003-5-2"}')
rr.set('t1854', '{"name":"大野","population":51200,"date_mod":"2003-6-11"}')
rr.set('t1855', '{"name":"勝山","population":74200,"date_mod":"2003-7-9"}')
rr.set('t1856', '{"name":"鯖江","population":67100,"date_mod":"2003-9-4"}')
rr.set('t1857', '{"name":"あわら","population":39600,"date_mod":"2003-10-17"}')
rr.set('t1858', '{"name":"越前","population":57500,"date_mod":"2003-8-15"}')
rr.set('t1859', '{"name":"坂井","population":28400,"date_mod":"2003-11-24"}')
#
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
