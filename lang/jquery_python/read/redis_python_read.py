#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	redis_python_read.py
#
#						Jun/22/2011
#
#
import sys
import json
import redis
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mcache_manipulate import mcache_to_dict_proc
#
# ----------------------------------------------------------------
#rr = redis.Redis(host='localhost', port=6379, db=0)
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
keys = {'t1851','t1852','t1853',
	't1854','t1855','t1856',
	't1857','t1858','t1859'}

dict_aa = mcache_to_dict_proc (rr,keys)
out_str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
#
print out_str_aa
#
# ----------------------------------------------------------------
