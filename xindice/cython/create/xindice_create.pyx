# -*- coding: utf-8 -*-
#
#	create/xindice_create.pyx
#
#				Oct/31/2011
#
# ------------------------------------------------------------------
import os
import sys
import pycurl
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from xml_manipulate import dict_to_xml_proc
from text_manipulate import dict_append_proc
#
from curl_get import curl_put_proc
#
# --------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0271',u'青森',171842,'1925-8-30')
	dict_aa = dict_append_proc (dict_aa,'t0272',u'弘前',72356,'1925-2-10')
	dict_aa = dict_append_proc (dict_aa,'t0273',u'八戸',26754,'1925-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0274',u'三沢',83672,'1925-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0275',u'黒石',42391,'1925-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0276',u'むつ',35187,'1925-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0277',u'五所川原',81246,'1925-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0278',u'十和田',24784,'1925-10-26')
	dict_aa = dict_append_proc (dict_aa,'t0279',u'平川',75829,'1925-12-15')
#
	return	dict_aa
#
#
# --------------------------------------------------------------------
url_base = 'http://cdbd026:8888/xindice/db/'
url_sub = 'cities/cities'
url_target = url_base + url_sub
#
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
out_str = dict_to_xml_proc (dict_aa)
#
curl_put_proc (url_target,out_str.encode('utf-8'))
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
