#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	exist/python/create/exist_create.py
#
#				Aug/23/2010
#
# ------------------------------------------------------------------
import os
import sys
import	urllib
import xml.dom.minidom
import pycurl
#
sys.path.append ("/var/www/uchida/data_base/common/python_common")
#
from json_disp import json_display_proc
#
from exist_fetch import exist_file_upload
# ------------------------------------------------------------------
from xml_disp import xml_write_proc
from xml_disp import to_xml_convert_proc
from file_io import file_write_proc
#
# --------------------------------------------------------------------
def	data_prepare_proc ():
	array_aa = []
#
	array_aa.append ({'id':4251,'name':u'長崎','population':60100,'date_mod':'2003-4-17'})
#
	array_aa.append ({'id':4252,'name':u'佐世保','population':31705,'date_mod':'2003-5-24'})
#
	array_aa.append ({'id':4253,'name':u'島原','population':21007,'date_mod':'2003-8-21'})
	array_aa.append ({'id':4254,'name':u'大村','population':91008,'date_mod':'2003-9-15'})
	array_aa.append ({'id':4255,'name':u'諫早','population':34206,'date_mod':'2003-6-19'})
	array_aa.append ({'id':4256,'name':u'五島','population':61029,'date_mod':'2003-6-14'})
	array_aa.append ({'id':4257,'name':u'平戸','population':21057,'date_mod':'2003-3-11'})
	array_aa.append ({'id':4258,'name':u'雲仙','population':41079,'date_mod':'2003-9-12'})
	array_aa.append ({'id':4259,'name':u'松浦','population':31089,'date_mod':'2003-8-23'})
#
	array_bb = {'cities': array_aa}
#
	return	array_bb
#
# --------------------------------------------------------------------
# ------------------------------------------------------------------
collections = 'cities'
xml_file = "cities.xml"
#
print ("*** 開始 ***")
#
array_bb = data_prepare_proc ()
json_display_proc (array_bb)
out_str = to_xml_convert_proc (array_bb)
file_write_proc (xml_file,out_str)
#
exist_file_upload (collections,xml_file,xml_file)
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
