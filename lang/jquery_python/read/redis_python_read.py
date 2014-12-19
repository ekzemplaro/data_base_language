#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	redis_python_read.py
#
#						Dec/09/2014
#
#
import sys
import json
import redis
#
# ----------------------------------------------------------------
rr = redis.Redis(host='host_dbase', port=6379, db=0)
#
keys = rr.keys ('t*')

dict_aa = {} 
for key_bb in sorted (keys):
	str_json = rr.get(key_bb).decode ()
	unit_aa = json.loads (str_json)
	key = key_bb.decode ()
	dict_aa[key] = unit_aa
#
out_str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
#
print (out_str_aa)
#
# ----------------------------------------------------------------
