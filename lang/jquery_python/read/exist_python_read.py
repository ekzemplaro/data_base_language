#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	exist_python_read.py
#
#					May/13/2011
#
# ------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from xml_manipulate import xml_to_dict_proc
from curl_get import curl_get_proc
#
#server_db = 'http://cpt003:8086/exist/rest/db/'
server_db = 'http://localhost:8086/exist/rest/db/'
url_in = server_db + 'cities/cities.xml'
#
xml_str = curl_get_proc (url_in)
dict_aa=xml_to_dict_proc (xml_str)
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa.encode('utf_8')
#
