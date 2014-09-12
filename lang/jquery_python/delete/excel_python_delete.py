#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	excel_python_delete.py
#
#					Sep/05/2014
#
# ---------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from excel_manipulate import excel_read_proc
from excel_manipulate import excel_write_proc
from text_manipulate import dict_delete_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
print ("*** start *** excel_python_delete.py ***<br />")
#
file_excel = "/var/tmp/excel/cities.xls"
dict_aa=excel_read_proc (file_excel)
#
#
array_bb = parse_parameter ()
#
print ("*** len(array_bb) =  %d text_python_delete.py ***<br />" % len(array_bb))
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print ("py id_in = %s<br />" % id_in)
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
excel_write_proc (file_excel,dict_aa)
#
#
print ("*** OK ***<br />")
#
# ---------------------------------------------------------------
