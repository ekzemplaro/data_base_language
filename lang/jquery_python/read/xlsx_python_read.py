#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	xlsx_python_read.py
#
#						Aug/19/2013
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from xlsx_manipulate import xlsx_read_proc
# ---------------------------------------------------------------------
#
file_xlsx = "/var/tmp/xlsx/cities.xlsx"
#
#
dict_aa = xlsx_read_proc (file_xlsx)
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
