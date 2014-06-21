#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mmcached_python_read.py
#
#						Sep/02/2010
#
#
import sys
import json
import memcache
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from mcache_manipulate import add_id_to_json_proc
#
# ----------------------------------------------------------------
def to_json_proc (mc):
	out_str="{\"cities\": ["
	for key in range (1731,1740):
		str_key = str (key)
		json_unit = mc.get(str_key)
		if (json_unit != None):
			out_str += add_id_to_json_proc (json_unit,key)
			out_str += ","
		key += 1
#
	llx = len (out_str)
	out_str = out_str[:llx-1] + "]}"
#
	return	out_str
# ----------------------------------------------------------------
mc = memcache.Client(['localhost:11211'])
out_str_aa = to_json_proc (mc)
#
print "Content-type: text/json\n\n"
#
print out_str_aa
#
# ----------------------------------------------------------------
