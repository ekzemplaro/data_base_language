#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	json_python_read.py
#
#					Jul/25/2014
#
# ---------------------------------------------------------------------
import	sys
sys.path.append ("/var/www/data_base/common/python_common")
#
from file_io import file_to_str_proc
#
# ---------------------------------------------------------------------
file_json = "/var/tmp/json/cities.json"
#
json_str=file_to_str_proc (file_json)
#
print ("Content-type: text/json\n\n")
#
print (json_str)
#
# ---------------------------------------------------------------------
