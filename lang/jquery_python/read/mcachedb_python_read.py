#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mmcachedb_python_read.py
#
#						Oct/07/2014
#
#
import sys
import json
import memcache
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mcache_manipulate import mcache_to_dict_proc
#
# ----------------------------------------------------------------
mc = memcache.Client(['localhost:21201'])
keys = {'t1521','t1522','t1523',
	't1524','t1525','t1526',
	't1527','t1528','t1529',
	't1530','t1531','t1532'}

dict_aa = mcache_to_dict_proc (mc,keys)
out_str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
#
print (out_str_aa)
#
# ----------------------------------------------------------------
