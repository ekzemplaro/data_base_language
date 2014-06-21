#! /usr/bin/python
# -*- coding: utf-8 -*-
#
import	sys
import	string
#
sys.path.append ("/var/www/uchida/data_base/python_common")
#
from xml_to_json import xml_to_json_proc
#
file_in = "/var/tmp/xml_file/cities.xml"
#
#
fp_in = open (file_in,"r")
lines = fp_in.readlines ()
fp_in.close ()
llx = len (lines)
#
xml_str = ""
for line in lines:
	xml_str += line
#
str_aa=xml_to_json_proc (xml_str)
#

print "Content-type: text/json\n\n"
print	str_aa.encode('utf_8')
#
