#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#		xindice_python_read.py
#
#				Apr/09/2010
#
import	sys
import	string
import urllib
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from xml_to_json import xml_to_json_proc
#
opener = urllib.FancyURLopener ({})
#
server_db = 'http://cdbd026:8888/xindice/db/'
url_in = server_db + 'cities/cities'
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
