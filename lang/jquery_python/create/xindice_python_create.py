#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	xindice_python_create.py
#
#						May/13/2011
# -------------------------------------------------------------------------
import	os
import	sys
import	pycurl
sys.path.append ('/var/www/data_base/common/python_common')
#
from curl_get import file_upload_proc
from file_io import file_write_proc
from xml_manipulate import dict_to_xml_proc
from text_manipulate import dict_append_proc
#
# -------------------------------------------------------------------------
def	data_prepare_proc ():
	dict_aa = {}
	dict_aa = dict_append_proc (dict_aa,'t0271',u'青森',59100,'2003-4-30')
	dict_aa = dict_append_proc (dict_aa,'t0272',u'弘前',47200,'2003-5-10')
	dict_aa = dict_append_proc (dict_aa,'t0273',u'八戸',26600,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t0274',u'三沢',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t0275',u'黒石',42300,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t0276',u'むつ',35100,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t0277',u'五所川原',24600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t0278',u'十和田',28400,'2003-12-26')
	dict_aa = dict_append_proc (dict_aa,'t0279',u'平川',75300,'2003-10-15')
#
#
	return	dict_aa
#
# -------------------------------------------------------------------------
#
dict_aa = data_prepare_proc ()
#
xml_file_src = "/tmp/cities_tmp0095.xml"
#
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file_src,out_str.encode('utf-8'))
#
url_base = 'http://cdbd026:8888/xindice/db/'
url_sub = 'cities/cities'
url_target = url_base + url_sub
file_upload_proc (url_target,xml_file_src)
#
os.remove (xml_file_src)
#
print "Content-type: text/html\n\n"
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
