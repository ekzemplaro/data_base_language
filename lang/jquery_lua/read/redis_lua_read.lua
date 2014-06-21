#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	redis_python_read.py
#
#						Sep/02/2010
#
#
import sys
import json
import redis
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from mcache_manipulate import add_id_to_json_proc
#
# ----------------------------------------------------------------
def to_json_proc (rr):
	out_str="{\"cities\": ["
	for key in range (1851,1860):
		str_key = str (key)
		json_unit = rr.get(str_key)
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
rr = redis.Redis(host='localhost', port=6379, db=0)
out_str_aa = to_json_proc (rr)
#
print "Content-type: text/json\n\n"
#
print out_str_aa
#
# ----------------------------------------------------------------
