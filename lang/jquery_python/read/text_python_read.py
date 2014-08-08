#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	text_python_read.py
#
#						Jul/31/2014
#
#
# ---------------------------------------------------------------------
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import text_read_proc
#
# ---------------------------------------------------------------------
file_in = "/var/tmp/plain_text/cities.txt"
#
dict_aa = text_read_proc (file_in)
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json; charset=UTF-8\n\n")
print (str_aa)
# ---------------------------------------------------------------------
