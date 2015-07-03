#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	calc_python_read.py
#
#						Jun/24/2015
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from calc_manipulate import calc_read_proc
# ---------------------------------------------------------------------
#
file_excel = "/var/tmp/calc/cities.ods"
#
#
dict_aa = calc_read_proc (file_excel)
str_aa = json.dumps (dict_aa)
#
print ("Content-type: text/json\n\n")
print	(str_aa)
