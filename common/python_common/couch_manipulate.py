# -*- coding: utf-8 -*-
#
#	couch_manipulate.py
#
#					Aug/13/2017
#
# ----------------------------------------------------------------
import sys
import json
#
from text_manipulate import dict_append_proc
from requests_get import requests_put_proc
from requests_get import requests_delete_proc
#
from requests_get import requests_get_proc
# ----------------------------------------------------------------
def couch_to_dict_proc (url_json):
	url_all_docs = url_json + "/" + "_all_docs?include_docs=true"
	str_json = requests_get_proc (url_all_docs)
	list_aa = json.loads (str_json)

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
	requests_delete_proc (url_collection)
	requests_put_proc (url_collection,'{}')
#
	for key in dict_aa:
		value = dict_aa[key]
		json_str = json.dumps (value)
		url_target = url_collection + '/' + key
		requests_put_proc (url_target,json_str)
#
# ----------------------------------------------------------------
