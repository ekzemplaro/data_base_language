#! /usr/bin/python3
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	mcachedb_python_create.py
#
#						Jun/24/2015
# -------------------------------------------------------------------------
import memcache
#
# -------------------------------------------------------------------------
mc = memcache.Client(['host_ubuntu1:21201'])
mc.flush_all()
#
mc.set('t1521', '{"name":"新潟","population":71900,"date_mod":"2003-5-24"}')
mc.set('t1522', '{"name":"長岡","population":46200,"date_mod":"2003-6-11"}')
mc.set('t1523', '{"name":"新発田","population":56700,"date_mod":"2003-8-2"}')
mc.set('t1524', '{"name":"上越","population":15600,"date_mod":"2003-8-14"}')
mc.set('t1525', '{"name":"糸魚川","population":63100,"date_mod":"2003-3-21"}')
mc.set('t1526', '{"name":"加茂","population":35700,"date_mod":"2003-10-7"}')
mc.set('t1527', '{"name":"三条","population":67200,"date_mod":"2003-11-12"}')
mc.set('t1528', '{"name":"佐渡","population":54500,"date_mod":"2003-10-21"}')
mc.set('t1529', '{"name":"柏崎","population":67100,"date_mod":"2003-12-14"}')
mc.set('t1530', '{"name":"村上","population":73200,"date_mod":"2003-2-5"}')
mc.set('t1531', '{"name":"十日町","population":82800,"date_mod":"2003-6-7"}')
mc.set('t1532', '{"name":"五泉","population":48100,"date_mod":"2003-7-9"}')
#
#
print ("Content-type: text/html\n\n")
#
print ("*** OK ***<p />")
# -------------------------------------------------------------------------
