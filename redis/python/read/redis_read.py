#! /usr/bin/python3
# -*- coding:utf-8 -*-
#
#	redis_read.py
#
#					Dec/09/2014
#
# --------------------------------------------------------------
import sys
import redis
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc

# --------------------------------------------------------------
print ("*** 開始 ***")

rr = redis.Redis(host='host_dbase', port=6379, db=0)

keys = rr.keys ('t*')

for key in sorted (keys):
	str_json = rr.get(key).decode ()
	unit_aa = json.loads (str_json)
	str_out = key.decode ()+"\t"+ unit_aa['name']
	str_out += "\t"+ str (unit_aa['population'])
	str_out += "\t"+ unit_aa['date_mod']
	print (str_out)
#
print ("*** 終了 ***")
#
# --------------------------------------------------------------
