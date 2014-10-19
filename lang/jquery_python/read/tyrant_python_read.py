#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	tyrant_python_read.py
#
#						Oct/07/2014
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
mc = memcache.Client(['localhost:1978'])

keys = {'t4761','t4762','t4763',
	't4764','t4765','t4766',
	't4767','t4768','t4769'}

dict_aa = mcache_to_dict_proc (mc,keys)
out_str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
#
print (out_str_aa)
#
# ----------------------------------------------------------------
