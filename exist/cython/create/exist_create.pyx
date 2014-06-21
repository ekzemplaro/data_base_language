# -*- coding: utf-8 -*-
#
#	exist_create.pyx
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
from curl_get import curl_put_proc
#
# --------------------------------------------------------------------
def	data_prepare_proc ():
#
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t4251',u'長崎',59371,'1925-4-30')
	dict_aa = dict_append_proc (dict_aa,'t4252',u'佐世保',47235,'1925-5-10')
	dict_aa = dict_append_proc (dict_aa,'t4253',u'島原',26854,'1925-6-14')
	dict_aa = dict_append_proc (dict_aa,'t4254',u'大村',83672,'1925-9-9')
	dict_aa = dict_append_proc (dict_aa,'t4255',u'諫早',42391,'1925-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4256',u'五島',35187,'1925-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4257',u'平戸',81246,'1925-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4258',u'雲仙',24784,'1925-10-26')
	dict_aa = dict_append_proc (dict_aa,'t4259',u'松浦',75823,'1925-12-15')
#
	return	dict_aa
#
#
# --------------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
out_str = dict_to_xml_proc (dict_aa)
#
url_base = 'http://localhost:8086/exist/rest/db/'
collections = 'cities'
xml_file = "cities.xml"
url = url_base + collections + '/' + xml_file
#
curl_put_proc (url,out_str.encode('utf-8'))
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
