#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#		xindice_python_read.py
#
#				May/13/2011
#
import	sys
import	string
import	json
import urllib
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from xml_manipulate import xml_to_dict_proc
#
opener = urllib.FancyURLopener ({})
#
server_db = 'http://host_dbase:8888/xindice/db/'
url_in = server_db + 'cities/cities'
#
#
ff = opener.open (url_in)
#
xml_str = ff.read ()
#
#
dict_aa=xml_to_dict_proc (xml_str)
str_aa = json.dumps (dict_aa)
#

print "Content-type: text/json\n\n"
print	str_aa.encode('utf_8')
#
