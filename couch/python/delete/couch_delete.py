#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	delete/couch_delete.py
#
#					Jun/19/2014
# ----------------------------------------------------------------
import	os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import string
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
from curl_get import curl_delete_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
url_json = 'http://localhost:5984/nagano'
url_key = url_json + '/' + key_in
#
str_buf_aa = curl_get_proc (url_key)
#
print "len (str_buf) = %d\n" % len (str_buf_aa)
#
unit_aa = json.loads (str_buf_aa)
#
if ('_rev' in unit_aa):
	print (unit_aa['_rev'])
	url_del = url_key + '?rev=' + unit_aa['_rev']
	curl_delete_proc (url_del)
else:
	print ("*** not exist ***")
	print (unit_aa)
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
