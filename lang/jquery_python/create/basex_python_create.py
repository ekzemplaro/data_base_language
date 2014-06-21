#! /usr/bin/python
# -*- coding: utf-8 -*-
# -------------------------------------------------------------------------
#	basex_python_create.py
#
#						Jul/10/2012
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
	dict_aa = dict_append_proc (dict_aa,'t4161',u'佐賀',59400,'2003-8-30')
	dict_aa = dict_append_proc (dict_aa,'t4162',u'唐津',47800,'2003-2-10')
	dict_aa = dict_append_proc (dict_aa,'t4163',u'鳥栖',26700,'2003-6-14')
	dict_aa = dict_append_proc (dict_aa,'t4164',u'多久',83600,'2003-9-9')
	dict_aa = dict_append_proc (dict_aa,'t4165',u'伊万里',42300,'2003-8-4')
	dict_aa = dict_append_proc (dict_aa,'t4166',u'武雄',35100,'2003-1-21')
	dict_aa = dict_append_proc (dict_aa,'t4167',u'鹿島',24600,'2003-7-23')
	dict_aa = dict_append_proc (dict_aa,'t4168',u'小城',28400,'2003-12-26')
	dict_aa = dict_append_proc (dict_aa,'t4169',u'嬉野',75300,'2003-10-15')
#
#
	return	dict_aa
#
# -------------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
dict_aa = data_prepare_proc ()
#
xml_file_src = "/tmp/cities_tmp00984.xml"
#
out_str = dict_to_xml_proc (dict_aa)
file_write_proc (xml_file_src,out_str.encode('utf-8'))
#
url_target = 'http://admin:admin@localhost:8984/rest/cities'
file_upload_proc (url_target,xml_file_src)
#
os.remove (xml_file_src)
#
#
print	"*** OK ***<p />"
# -------------------------------------------------------------------------
