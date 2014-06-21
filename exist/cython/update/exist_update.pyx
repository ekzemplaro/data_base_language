#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	update/exist_update.py
#
#				Sep/20/2011
#
# ------------------------------------------------------------------
import os
import sys
import	urllib
import xml.dom.minidom
import pycurl
import cStringIO
import string
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from text_manipulate import dict_update_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
#
from curl_get import curl_get_proc
from curl_get import curl_put_proc
# ------------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
collections = 'cities'
xml_file = "cities.xml"
url = 'http://localhost:8086/exist/rest/db/' + collections + '/' + xml_file
#
str_aa = curl_get_proc (url)
dict_aa=xml_to_dict_proc (str_aa)
#
dict_update_proc (dict_aa,id_in,population_in)
#
out_str = dict_to_xml_proc (dict_aa)
#
curl_put_proc (url,out_str.encode('utf-8'))
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
