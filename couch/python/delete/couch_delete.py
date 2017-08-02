#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	delete/couch_delete.py
#
#					Jul/31/2017
# ----------------------------------------------------------------
import	os
import sys
import string
import pycurl
import json
#
sys.path.append('../../../common/python_common')
from curl_get import curl_get_proc
from curl_get import curl_delete_proc
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
str_buf_aa = curl_get_proc(url_key)
#
print("len (str_buf) = %d\n" % len(str_buf_aa))
#
unit_aa = json.loads(str(str_buf_aa,'UTF-8'))
#
if ('_rev' in unit_aa):
	print(unit_aa['_rev'])
	url_del = url_key + '?rev=' + unit_aa['_rev']
	curl_delete_proc(url_del)
else:
	print("*** not exist ***")
	print(unit_aa)
#
sys.stderr.write("*** 終了 ***\n")
# ----------------------------------------------------------------
