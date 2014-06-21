#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	couch_python_create.py
#
#						Jun/19/2014
# -------------------------------------------------------------------------
import os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
from curl_get import curl_put_proc
from curl_get import curl_delete_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t2021',u'長野',95300,'2003-8-12')
#
	dict_aa = dict_append_proc (dict_aa,'t2022',u'松本',73100,'2003-5-15')
#
	dict_aa = dict_append_proc (dict_aa,'t2023',u'上田',75100,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t2024',u'小諸',51800,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t2025',u'岡谷',72600,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t2026',u'塩尻',84300,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t2027',u'茅野',96800,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t2028',u'飯田',53600,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t2029',u'中野',64200,'2003-11-14')
	dict_aa = dict_append_proc (dict_aa,'t2030',u'諏訪',82100,'2003-7-04')
	dict_aa = dict_append_proc (dict_aa,'t2031',u'駒ヶ根',47800,'2003-9-17')
	dict_aa = dict_append_proc (dict_aa,'t2032',u'佐久',25300,'2003-7-20')
	dict_aa = dict_append_proc (dict_aa,'t2033',u'伊那',12700,'2003-3-12')
	dict_aa = dict_append_proc (dict_aa,'t2034',u'千曲',63400,'2003-8-17')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
os.environ["http_proxy"]=''
url_collection = 'http://localhost:5984/nagano'
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
#
#
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
