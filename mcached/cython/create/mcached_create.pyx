# -*- coding: utf-8 -*-
#
#	create/memcached_create.pyx
#
#					Nov/07/2011
#
import sys
import memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_display_proc
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
mc = memcache.Client(['127.0.0.1:11211'])
mc.flush_all()
#
mc.set('t1731', '{"name":"金沢","population":64952,"date_mod":"1925-2-5"}')
mc.set('t1732', '{"name":"輪島","population":41598,"date_mod":"1925-8-28"}')
mc.set('t1733', '{"name":"小松","population":53671,"date_mod":"1925-9-2"}')
mc.set('t1734', '{"name":"七尾","population":15623,"date_mod":"1925-1-14"}')
mc.set('t1735', '{"name":"珠洲","population":32687,"date_mod":"1925-5-4"}')
mc.set('t1736', '{"name":"加賀","population":31672,"date_mod":"1925-10-7"}')
mc.set('t1737', '{"name":"羽咋","population":58656,"date_mod":"1925-11-4"}')
mc.set('t1738', '{"name":"かほく","population":71351,"date_mod":"1925-10-17"}')
mc.set('t1739', '{"name":"白山","population":23984,"date_mod":"1925-9-21"}')
#
keys = {'t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739'}
#
for key in keys:
	mcache_display_proc (mc,key)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
