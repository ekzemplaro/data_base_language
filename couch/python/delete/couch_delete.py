#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	delete/couch_delete.py
#
#					Aug/13/2017
# ----------------------------------------------------------------
import	os
import sys
import string
import json
import requests
#
sys.path.append('../../../common/python_common')
from requests_get import requests_get_proc
from requests_get import requests_delete_proc
#
# ----------------------------------------------------------------
sys.stderr.write("*** 開始 ***\n")
#
key_in = sys.argv[1]
print("%s" % key_in)
#
url_json = 'http://localhost:5984/nagano'
url_key = url_json + '/' + key_in
#
str_buf_aa = requests_get_proc(url_key)
#
print("len (str_buf) = %d\n" % len(str_buf_aa))
#
unit_aa = json.loads(str_buf_aa)
#
if ('_rev' in unit_aa):
	print(unit_aa['_rev'])
	url_del = url_key + '?rev=' + unit_aa['_rev']
	requests_delete_proc(url_del)
else:
	print("*** not exist ***")
	print(unit_aa)
#
sys.stderr.write("*** 終了 ***\n")
# ----------------------------------------------------------------
