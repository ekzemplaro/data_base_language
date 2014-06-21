#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	riak_python_create.py
#
#						Dec/10/2013
# -------------------------------------------------------------------------
import os
import sys
import json
import httplib2
#
sys.path.append ('/var/www/data_base/common/python_common')
#
from text_manipulate import dict_append_proc
#
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t3251',u'松江',39500,'2003-9-8')
	dict_aa = dict_append_proc (dict_aa,'t3252',u'出雲',68700,'2003-5-20')
	dict_aa = dict_append_proc (dict_aa,'t3253',u'大田',51400,'2003-1-12')
	dict_aa = dict_append_proc (dict_aa,'t3254',u'雲南',53800,'2003-9-21')
	dict_aa = dict_append_proc (dict_aa,'t3255',u'江津',73600,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t3256',u'浜田',84900,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t3257',u'益田',96500,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t3258',u'安来',57600,'2003-2-12')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
url_base = 'http://localhost:8098/riak/shimane'
#
dict_aa = data_prepare_proc ()
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
#
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
