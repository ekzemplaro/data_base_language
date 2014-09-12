#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	pdf_python_update.py
#
#					Sep/09/2014
#
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc
from pdf_manipulate import pdf_to_dict_proc
from pdf_manipulate import dict_to_pdf_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
file_pdf = "/var/tmp/pdf/cities.pdf"
dict_aa = pdf_to_dict_proc (file_pdf)
#
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print ("id_in = %s<br />" % id_in)
	print ("population_in = %d<br />" % population_in)
	dict_aa = dict_update_proc (dict_aa,id_in,population_in)
#
#
dict_to_pdf_proc (file_pdf,dict_aa)
#
#
print ("*** OK ***<br />")
#
# ---------------------------------------------------------------
