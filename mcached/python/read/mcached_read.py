#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mcached_read.py
#
#					Oct/07/2014
#
import	sys
#
import memcache
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_to_dict_proc
from text_manipulate import dict_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
mc = memcache.Client(['localhost:11211'])
#
keys = {'t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739'}
#
dict_aa = mcache_to_dict_proc (mc,keys)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
