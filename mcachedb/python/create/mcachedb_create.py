#!/usr/bin/python3
# -*- coding: utf-8 -*-
#
#	create/mcachedb_create.py
#
#					Jul/29/2014
#
import memcache
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
mc = memcache.Client(['127.0.0.1:21201'])
mc.flush_all()
#
mc.set('t1521', '{"name":"新潟","population":37561,"date_mod":"2003-4-24"}')
mc.set('t1522', '{"name":"長岡","population":46382,"date_mod":"2003-6-11"}')
mc.set('t1523', '{"name":"新発田","population":51643,"date_mod":"2003-7-2"}')
mc.set('t1524', '{"name":"上越","population":15624,"date_mod":"2003-8-14"}')
mc.set('t1525', '{"name":"糸魚川","population":37692,"date_mod":"2003-9-17"}')
mc.set('t1526', '{"name":"加茂","population":58619,"date_mod":"2003-10-27"}')
mc.set('t1527', '{"name":"三条","population":27698,"date_mod":"2003-11-24"}')
mc.set('t1528', '{"name":"佐渡","population":58751,"date_mod":"2003-10-7"}')
mc.set('t1529', '{"name":"柏崎","population":65125,"date_mod":"2003-12-14"}')
mc.set('t1530', '{"name":"村上","population":34247,"date_mod":"2003-2-6"}')
mc.set('t1531', '{"name":"十日町","population":17238,"date_mod":"2003-6-8"}')
mc.set('t1532', '{"name":"五泉","population":48921,"date_mod":"2003-5-7"}')
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
