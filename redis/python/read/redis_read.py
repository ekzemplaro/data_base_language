#! /usr/bin/python3
# -*- coding:utf-8 -*-
#
#	redis_read.py
#
#					Jun/23/2017
#
# --------------------------------------------------------------
import sys
import redis
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc

# --------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")

rr = redis.Redis(host='localhost', port=6379, db=0)

keys = rr.keys ('t*')

for key in sorted (keys):
	str_json = rr.get(key).decode ()
	unit_aa = json.loads (str_json)
	str_out = key.decode ()+"\t"+ unit_aa['name']
	str_out += "\t"+ str (unit_aa['population'])
	str_out += "\t"+ unit_aa['date_mod']
	print (str_out)
#
sys.stderr.write("*** 終了 ***\n")
#
# --------------------------------------------------------------
