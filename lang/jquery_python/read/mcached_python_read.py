#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mmcached_python_read.py
#
#						May/30/2011
#
# ----------------------------------------------------------------
import sys
import json
import memcache
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mcache_manipulate import mcache_to_dict_proc
#
# ----------------------------------------------------------------
mc = memcache.Client(['localhost:11211'])

keys = {'t1731','t1732','t1733',
	't1734','t1735','t1736',
	't1737','t1738','t1739'}

dict_aa = mcache_to_dict_proc (mc,keys)
out_str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
#
print out_str_aa
#
# ----------------------------------------------------------------
