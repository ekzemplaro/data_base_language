# -*- coding: utf-8 -*-
#
#	couch_manipulate.py
#
#					May/06/2015
#
# ----------------------------------------------------------------
import sys
import pycurl
import json
#
from text_manipulate import dict_append_proc
from curl_get import curl_get_proc
from curl_get import curl_put_proc
from curl_get import curl_delete_proc
#
# ----------------------------------------------------------------
def couch_to_dict_proc (url_json):
	url_all_docs = url_json + "/" + "_all_docs?include_docs=true"
	str_json = curl_get_proc (url_all_docs)
	list_aa = json.loads (str (str_json,'UTF-8'))

	dict_aa = {}
#
	if ('rows' in list_aa):
		for it in list_aa['rows']:
			key_aa = it['key']
			unit_aa = it['doc']
			name = unit_aa['name']
			dict_append_proc (dict_aa,key_aa,name, \
				unit_aa['population'],unit_aa['date_mod'])
	else:
		sys.stderr.write ("*** db not exist. ***\n")
#
	return dict_aa
#
# ----------------------------------------------------------------
def	dict_to_couch_proc (dict_aa,url_collection):
	curl_delete_proc (url_collection)
	curl_put_proc (url_collection,'{}')
#
	for key in dict_aa:
		value = dict_aa[key]
		json_str = json.dumps (value)
		url_target = url_collection + '/' + key
		curl_put_proc (url_target,json_str)
#
# ----------------------------------------------------------------
