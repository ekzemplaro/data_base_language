#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	webdav_create.py
#
#					Aug/01/2014
# ----------------------------------------------------------------
#
import os
import sys
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate	import dict_append_proc
from curl_get import curl_put_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t1351','八王子',41295,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t1352','立川',38724,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t1353','武蔵野',54236,'2003-3-15')
	dict_aa = dict_append_proc (dict_aa,'t1354','三鷹',71538,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t1355','青梅',79671,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t1356','府中',89532,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t1357','昭島',96174,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t1358','調布',53926,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t1359','町田',64736,'2003-11-14')
#
	return	dict_aa

#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
url_target = 'http://host_dbase:3004/city/tokyo.json'
#
dict_aa = data_prepare_proc ()
#
out_str = json.dumps (dict_aa)
#
curl_put_proc (url_target,out_str)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
