#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	pdf_python_read.py
#
#						Jul/09/2012
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from pdf_manipulate import pdf_to_dict_proc
# ---------------------------------------------------------------------
#
file_pdf = "/var/tmp/pdf/cities.pdf"
#
#
dict_aa = pdf_to_dict_proc (file_pdf)
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
