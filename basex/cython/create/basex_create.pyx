# -*- coding: utf-8 -*-
#
#	create/basex_create.pyx
#
#				Nov/01/2011
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
	dict_aa = dict_append_proc (dict_aa,'t4161',u'佐賀',59718,'1925-4-30')
	dict_aa = dict_append_proc (dict_aa,'t4162',u'唐津',47235,'1925-5-10')
	dict_aa = dict_append_proc (dict_aa,'t4163',u'鳥栖',28154,'1925-6-14')
	dict_aa = dict_append_proc (dict_aa,'t4164',u'多久',83672,'1925-9-9')
	dict_aa = dict_append_proc (dict_aa,'t4165',u'伊万里',42391,'1925-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4166',u'武雄',35187,'1925-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4167',u'鹿島',81246,'1925-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4168',u'小城',24784,'1925-10-26')
	dict_aa = dict_append_proc (dict_aa,'t4169',u'嬉野',75823,'1925-12-15')
#
	return	dict_aa
#
# --------------------------------------------------------------------
url_base = 'http://admin:admin@localhost:8984/rest/cities'
#
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
out_str = dict_to_xml_proc (dict_aa)
#
curl_put_proc (url_base,out_str.encode('utf-8'))
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
