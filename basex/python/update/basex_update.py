#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	basex_update.py
#
#				Oct/27/2011
#
# ---------------------------------------------------------------
import os
import sys
import string
import xml.dom.minidom
import pycurl
#
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from text_manipulate import dict_update_proc
from xml_manipulate import xml_to_dict_proc
from xml_manipulate import dict_to_xml_proc
#
from curl_get import curl_get_proc
from curl_get import curl_put_proc
#
# ---------------------------------------------------------------
print ("*** 開始 ***")
#
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
url_base = 'http://admin:admin@localhost:8984/rest/cities'
url_sub = '?query=/'
url_in = url_base + url_sub
#
str_aa = curl_get_proc (url_in)
dict_aa=xml_to_dict_proc (str_aa)
#
dict_update_proc (dict_aa,id_in,population_in)
#
out_str = dict_to_xml_proc (dict_aa)
#
curl_put_proc (url_base,out_str.encode('utf-8'))
#
print ("*** 終了 ***")
# ------------------------------------------------------------------
