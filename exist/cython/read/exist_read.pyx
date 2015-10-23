#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	exist/python/exist_read.py
#
#					May/31/2012
#
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	urllib
import xml.dom.minidom
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from text_manipulate import dict_display_proc
from xml_manipulate import xml_to_dict_proc
from curl_get import curl_get_proc
#
# ------------------------------------------------------------------
#
print ("*** 開始 ***")
#
collections = 'cities'
xml_file = 'cities.xml'
#
url = 'http://localhost:8086/exist/rest/db/' + collections + '/' + xml_file
#
str_aa = curl_get_proc (url)
dict_aa=xml_to_dict_proc (str_aa)
dict_display_proc (dict_aa)
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
