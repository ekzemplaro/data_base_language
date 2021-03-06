#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	exist_python_create.py
#
#						Jun/12/2012
# -------------------------------------------------------------------------
import	os
import	sys
import	pycurl
sys.path.append ('/var/www/data_base/common/python_common')
#
from curl_get import curl_put_proc
from xml_manipulate import dict_to_xml_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t4251',u'長崎',79300,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t4252',u'佐世保',47200,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t4253',u'島原',26400,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t4254',u'大村',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t4255',u'諫早',42300,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4256',u'五島',35100,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4257',u'平戸',81200,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4258',u'雲仙',24700,'2003-9-21')
	dict_aa = dict_append_proc (dict_aa,'t4259',u'松浦',82300,'2003-11-17')
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
out_str = dict_to_xml_proc (dict_aa)
#
url_base = 'http://nlf132:8086/exist/rest/db/'
collections = 'cities'
xml_file = "cities.xml"
url = url_base + collections + '/' + xml_file
#
curl_put_proc (url,out_str.encode('utf-8'))
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
