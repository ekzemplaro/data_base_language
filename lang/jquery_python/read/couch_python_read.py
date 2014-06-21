#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	couch_python_read.py
#
#						Jun/19/2014
#
#
# ---------------------------------------------------------------------
import	os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
from text_manipulate import dict_append_proc
# ---------------------------------------------------------------------
def couch_to_dict_proc (url_json):
	dict_aa = {}
	for it in list_aa['rows']:
		key_aa = it['key']
		str_tmp = curl_get_proc (url_json + "/" + key_aa)
		unit_aa = json.loads (str_tmp)
		name = unit_aa['name'].encode ('utf-8')
		dict_append_proc (dict_aa,key_aa,name, \
				unit_aa['population'],unit_aa['date_mod'])
#
#
	return dict_aa	
# ---------------------------------------------------------------------
print "Content-type: text/json\n\n"

os.environ["http_proxy"]=''
url_json = 'http://localhost:5984/nagano'

str_json = curl_get_proc (url_json + "/" + "_all_docs")
list_aa = json.loads (str_json)
if ('rows' in list_aa):
	dict_aa = couch_to_dict_proc (url_json)
	out_str_aa = json.dumps (dict_aa)
	print out_str_aa
#
#sys.stdout.write (str_json)
#
# ---------------------------------------------------------------------
