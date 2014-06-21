#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	dbxml_python_read.py
#
#					Apr/09/2010
#
import	sys
import	string
import urllib
#
sys.path.append ("/var/www/uchida/data_base/common/python_common")
#
from xml_to_json import xml_to_json_proc
#
opener = urllib.FancyURLopener ({})
#
user='scott'
password='tiger'
server_db = 'http://' + user + ':' + password + '@cpt003:7280/rest/'
collections = 'cities'
xml_file = 'cities.xml'
#
url_in = server_db + collections + '/' + xml_file
#
#
#
ff = opener.open (url_in)
#
xml_str = ff.read ()
#
#
str_aa=xml_to_json_proc (xml_str)
#

print "Content-type: text/json\n\n"
print	str_aa.encode('utf_8')
#
