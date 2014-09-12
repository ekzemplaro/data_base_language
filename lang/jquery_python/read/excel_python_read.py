#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	excel_python_read.py
#
#						Sep/05/2014
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from excel_manipulate import excel_read_proc
# ---------------------------------------------------------------------
#
file_excel = "/var/tmp/excel/cities.xls"
#
#
dict_aa = excel_read_proc (file_excel)
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print	(str_aa)
#
