#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	csv_read.py
#
#						May/11/2011
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
# ---------------------------------------------------------------------
file_in = "/var/tmp/csv/cities.csv"
#
dict_aa = csv_read_proc (file_in)
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
