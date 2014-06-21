#! /usr/bin/python
#
#	pdf_python_delete.py
#
#					Jul/09/2012
#
# ---------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from pdf_manipulate import pdf_to_dict_proc
from pdf_manipulate import dict_to_pdf_proc
#
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
print "*** start *** pdf_python_delete.py ***<br />"
#
file_pdf = "/var/tmp/pdf/cities.pdf"
dict_aa=pdf_to_dict_proc (file_pdf)
#
#
array_bb = parse_parameter ()
#
print "*** len(array_bb) =  %d text_python_delete.py ***<br />" % len(array_bb)
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "py id_in = %s<br />" % id_in
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
dict_to_pdf_proc (file_pdf,dict_aa)
#
#
print "*****<br />"
print "OK"
#
# ---------------------------------------------------------------
