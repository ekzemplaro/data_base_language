#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mcachedb_read.py
#
#					Feb/02/2015
#
import	sys
import	memcache
#
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_to_dict_proc
from text_manipulate import dict_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
mc = memcache.Client(['ubuntu_1504:21201'])
#
keys = {'t1521','t1522','t1523',
	't1524','t1525','t1526',
	't1527','t1528','t1529',
	't1530','t1531','t1532'}
#
dict_aa = mcache_to_dict_proc (mc,keys)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
