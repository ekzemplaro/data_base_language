#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	create/couch_create.py
#
#					Aug/01/2014
#
import os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
from curl_get import curl_put_proc
from curl_get import curl_delete_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t2021','長野',47395,'2003-8-21')
	dict_aa = dict_append_proc (dict_aa,'t2022','松本',31687,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t2023','上田',59462,'2003-6-8')
	dict_aa = dict_append_proc (dict_aa,'t2024','小諸',57238,'2003-7-24')
	dict_aa = dict_append_proc (dict_aa,'t2025','岡谷',73896,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026','塩尻',84129,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t2027','茅野',96351,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028','飯田',53476,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t2029','中野',64987,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2030','諏訪',82154,'2003-7-7')
	dict_aa = dict_append_proc (dict_aa,'t2031','駒ヶ根',72685,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2032','佐久',28741,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t2033','伊那',12753,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2034','千曲',62518,'2003-8-19')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_collection = 'http://localhost:5984/nagano'
#
dict_aa = data_prepare_proc ()
#
curl_delete_proc (url_collection)
curl_put_proc (url_collection,'{}')
#
for key in dict_aa:
	value = dict_aa[key]
	json_str = json.dumps (value)
	url_target = url_collection + '/' + key
	curl_put_proc (url_target,json_str)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
