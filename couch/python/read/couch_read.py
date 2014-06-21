#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	read/couch_read.py
#
#					Jun/19/2014
#
# ----------------------------------------------------------------
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
#from text_manipulate import dict_display_proc
from curl_get import curl_get_proc
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
os.environ["http_proxy"]=''
#
url_json = 'http://localhost:5984/nagano'

str_json = curl_get_proc (url_json + "/" + "_all_docs")
list_aa = json.loads (str_json)

#
if ('rows' in list_aa):
	for it in list_aa['rows']:
		key_aa = it['key']
		str_tmp = curl_get_proc (url_json + "/" + key_aa)
		unit_aa = json.loads (str_tmp)
		str_out = key_aa + '\t' +  unit_aa['name']
		str_out += '\t%d' %  unit_aa['population']
		str_out += '\t' +  unit_aa['date_mod']
		print (str_out)
else:
	print ("*** db not exist. ***")
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
