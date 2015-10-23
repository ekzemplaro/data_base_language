# -*- coding: utf-8 -*-
#
#	create/mcachedb_create.py
#
#					Sep/14/2015
#
import memcache
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
mc = memcache.Client(['host_ubuntu:21201'])
mc.flush_all()
#
mc.set('t1521', '{"name":"新潟","population":56187,"date_mod":"1925-5-18"}')
mc.set('t1522', '{"name":"長岡","population":38292,"date_mod":"1925-6-11"}')
mc.set('t1523', '{"name":"新発田","population":51643,"date_mod":"1925-7-2"}')
mc.set('t1524', '{"name":"上越","population":15624,"date_mod":"1925-8-14"}')
mc.set('t1525', '{"name":"糸魚川","population":32692,"date_mod":"1925-9-17"}')
mc.set('t1526', '{"name":"加茂","population":38613,"date_mod":"1925-10-27"}')
mc.set('t1527', '{"name":"三条","population":27698,"date_mod":"1925-11-24"}')
mc.set('t1528', '{"name":"佐渡","population":58751,"date_mod":"1925-10-7"}')
mc.set('t1529', '{"name":"柏崎","population":65125,"date_mod":"1925-12-14"}')
mc.set('t1530', '{"name":"村上","population":34247,"date_mod":"1925-2-6"}')
mc.set('t1531', '{"name":"十日町","population":17238,"date_mod":"1925-6-8"}')
mc.set('t1532', '{"name":"五泉","population":48921,"date_mod":"1925-5-7"}')
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
