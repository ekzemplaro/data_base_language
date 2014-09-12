#! /usr/bin/python3
#
#	xlsx_python_delete.py
#
#					Sep/08/2014
#
# ---------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from xlsx_manipulate import xlsx_read_proc
from xlsx_manipulate import xlsx_write_proc
from text_manipulate import dict_delete_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
file_xlsx = "/var/tmp/xlsx/cities.xlsx"
#
dict_aa=xlsx_read_proc (file_xlsx)
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print ("py id_in = %s<br />" % id_in)
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
xlsx_write_proc (file_xlsx,dict_aa)
#
#
print ("*** OK ***<br />")
#
# ---------------------------------------------------------------
