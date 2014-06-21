#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	create/riak_create.py
#
#					Dec/10/2013
#
# ----------------------------------------------------------------
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
import httplib2
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t3251',u'松江',31287,'2003-2-9')
#
	dict_aa = dict_append_proc (dict_aa,'t3252',u'出雲',68714,'2003-7-20')
#
	dict_aa = dict_append_proc (dict_aa,'t3253',u'大田',58162,'2003-5-12')
	dict_aa = dict_append_proc (dict_aa,'t3254',u'雲南',57238,'2003-9-21')
	dict_aa = dict_append_proc (dict_aa,'t3255',u'江津',73896,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t3256',u'浜田',84129,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t3257',u'益田',96351,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t3258',u'安来',53476,'2003-2-12')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_base = 'http://localhost:8098/riak/shimane'
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
#
http_client = httplib2.Http ()
for key in sorted (dict_aa.keys()):
	unit = dict_aa[key]
	json_str = json.dumps (unit)
	print json_str
	url_target = url_base + '/' + key
	resp, content = http_client.request(url_target,"PUT",headers={'content-type':'application/json'},body=json_str)
#	print resp
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
