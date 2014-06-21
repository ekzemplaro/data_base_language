#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	create/couch_create.py
#
#					Jun/19/2014
#
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
from curl_get import curl_put_proc
from curl_get import curl_delete_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t2021',u'長野',41395,'2003-8-12')
#
	dict_aa = dict_append_proc (dict_aa,'t2022',u'松本',32687,'2003-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t2023',u'上田',58462,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2024',u'小諸',57238,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2025',u'岡谷',73896,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026',u'塩尻',84129,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t2027',u'茅野',96351,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028',u'飯田',53476,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t2029',u'中野',64987,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2030',u'諏訪',82154,'2003-7-04')
	dict_aa = dict_append_proc (dict_aa,'t2031',u'駒ヶ根',72685,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2032',u'佐久',28741,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t2033',u'伊那',12753,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2034',u'千曲',62538,'2003-8-17')
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
dict_display_proc (dict_aa)
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
