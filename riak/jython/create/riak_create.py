#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	create/riak_create.py
#
#					Jun/25/2015
#
# ----------------------------------------------------------------
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
from text_manipulate import dict_append_proc
#
sys.path.append ('/var/www/data_base/common/jython_common')
from jython_get_uri import rest_put_proc
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t3251',u'松江',39276,'2004-7-5')
#
	dict_aa = dict_append_proc (dict_aa,'t3252',u'出雲',68724,'2004-11-10')
#
	dict_aa = dict_append_proc (dict_aa,'t3253',u'大田',58169,'2004-1-12')
	dict_aa = dict_append_proc (dict_aa,'t3254',u'雲南',57631,'2004-9-21')
	dict_aa = dict_append_proc (dict_aa,'t3255',u'江津',73496,'2004-4-19')
	dict_aa = dict_append_proc (dict_aa,'t3256',u'浜田',84329,'2004-10-14')
	dict_aa = dict_append_proc (dict_aa,'t3257',u'益田',96751,'2004-5-24')
	dict_aa = dict_append_proc (dict_aa,'t3258',u'安来',53176,'2004-2-12')
#
	return	dict_aa
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_base = 'http://host_ubuntu1:8098/riak/shimane'
#
dict_aa = data_prepare_proc ()
#
dict_display_proc (dict_aa)
#
for key in sorted (dict_aa.keys()):
	unit = dict_aa[key]
	json_str = json.dumps (unit)
	print json_str
	url_target = url_base + '/' + key
	rest_put_proc (url_target,json_str,"text/json")
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
