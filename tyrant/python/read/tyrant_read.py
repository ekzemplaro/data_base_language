#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	tyrant_read.py
#
#					Feb/06/2015
#
import	sys
#
import memcache
sys.path.append ('/var/www/data_base/common/python_common')
from mcache_manipulate import mcache_to_dict_proc
from text_manipulate import dict_display_proc
# ------------------------------------------------------------
print ("*** 開始 ***")
mc = memcache.Client(['ubuntu_1504:1978'])
#
keys = {'t4761','t4762','t4763',
	't4764','t4765','t4766',
	't4767','t4768','t4769'}
#
dict_aa = mcache_to_dict_proc (mc,keys)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
#
# ------------------------------------------------------------
