#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	webdav_create.py
#
#					Mar/18/2013
# ----------------------------------------------------------------
#
import os
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import pycurl
import json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate	import dict_display_proc
from text_manipulate	import dict_append_proc
from file_io	import file_write_proc
from curl_get import couch_drop_proc
from curl_get import file_upload_proc
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
#
	dict_aa = dict_append_proc (dict_aa,'t1351',u'八王子',41795,'2003-9-12')
	dict_aa = dict_append_proc (dict_aa,'t1352',u'立川',38724,'2003-5-15')
	dict_aa = dict_append_proc (dict_aa,'t1353',u'武蔵野',54236,'2003-6-12')
	dict_aa = dict_append_proc (dict_aa,'t1354',u'三鷹',71538,'2003-7-21')
	dict_aa = dict_append_proc (dict_aa,'t1355',u'青梅',79671,'2003-4-19')
	dict_aa = dict_append_proc (dict_aa,'t1356',u'府中',89532,'2003-10-14')
	dict_aa = dict_append_proc (dict_aa,'t1357',u'昭島',96174,'2003-5-24')
	dict_aa = dict_append_proc (dict_aa,'t1358',u'調布',53926,'2003-2-12')
	dict_aa = dict_append_proc (dict_aa,'t1359',u'町田',64736,'2003-11-14')
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
dict_display_proc (dict_aa)
#
out_str = json.dumps (dict_aa)
file_out_tmp="/tmp/tmp00871.json"
file_write_proc (file_out_tmp,out_str)
file_upload_proc (url_target,file_out_tmp)
#
os.remove (file_out_tmp)
#
print ("*** 終了 ***")
