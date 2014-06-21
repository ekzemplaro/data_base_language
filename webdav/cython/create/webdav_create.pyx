# -*- coding: utf-8 -*-
#
#	create/webdav_create.pyx
#
#					Mar/31/2012
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
#
# ----------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t1351',u'八王子',59726,'1925-5-16')
	dict_aa = dict_append_proc (dict_aa,'t1352',u'立川',38724,'1925-6-25')
	dict_aa = dict_append_proc (dict_aa,'t1353',u'武蔵野',62319,'1925-7-12')
	dict_aa = dict_append_proc (dict_aa,'t1354',u'三鷹',51538,'1925-9-21')
	dict_aa = dict_append_proc (dict_aa,'t1355',u'青梅',79671,'1925-4-19')
	dict_aa = dict_append_proc (dict_aa,'t1356',u'府中',81532,'1925-10-14')
	dict_aa = dict_append_proc (dict_aa,'t1357',u'昭島',93876,'1925-11-24')
	dict_aa = dict_append_proc (dict_aa,'t1358',u'調布',53425,'1925-2-12')
	dict_aa = dict_append_proc (dict_aa,'t1359',u'町田',64236,'1925-11-14')
#
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
#
curl_put_proc (url_target,out_str)
#
print ("*** 終了 ***")
#
# ----------------------------------------------------------------
