#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	riak_manipulate.py
#
#					Feb/09/2015
#
# ----------------------------------------------------------------
import sys
import json
import pycurl
import	datetime
#
sys.path.append ('/var/www/data_base/common/python_common')
from curl_get import curl_get_proc
from curl_get import curl_put_proc
#
# ----------------------------------------------------------------
def riak_to_dict_proc (url_in):
	dict_aa = {}
	url_in_true = url_in + '?keys=true'
#
	str_json = curl_get_proc (url_in_true)
#
	data_aa = json.loads (str(str_json,'UTF-8'))
#
	for key in data_aa['keys']:
		url_city = url_in + '/' + key
		content = curl_get_proc (url_city)
		if (3 < len (content)):
			unit_aa = json.loads (str (content,'UTF-8'))
			dict_aa[key] = unit_aa
#
	return	dict_aa

# ----------------------------------------------------------------
def dict_to_riak_proc (dict_aa,url_base):
#
	for key in dict_aa.keys():
		unit = dict_aa[key]
		json_str = json.dumps (unit)
		url_target = url_base + '/' + key
		curl_put_proc (url_target,json_str)
# ----------------------------------------------------------------
def riak_update_proc (url_base,key_in,population_in):
	url_target = url_base + '/' + key_in
	content = curl_get_proc (url_target)
#
	city = json.loads (str (content,'UTF-8'))
#
	city['population'] = population_in
	city['date_mod'] = '%s' % datetime.date.today ()
#
	out_json = json.dumps (city)
#
	curl_put_proc (url_target,out_json)
# ----------------------------------------------------------------
