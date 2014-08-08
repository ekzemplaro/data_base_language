#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	xml_python_read.py
#						Aug/05/2014
#
# ------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from file_io import file_to_str_proc
from xml_manipulate import xml_to_dict_proc
#
xml_file = "/var/tmp/xml_file/cities.xml"
#
xml_str=file_to_str_proc (xml_file)
#
dict_aa=xml_to_dict_proc (xml_str)
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print (str_aa)
#
# ------------------------------------------------------------------
