#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	epub_python_delete.py
#
#					May/09/2013
#
# ---------------------------------------------------------------
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_delete_proc
from epub_manipulate import epub_to_dict_proc
from epub_manipulate import dict_to_epub_proc
#
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
#
file_epub = "/var/tmp/epub/cities.epub"
dict_aa=epub_to_dict_proc (file_epub)
#
#
array_bb = parse_parameter ()
#
print "*** len(array_bb) =  %d epub_python_delete.py ***<br />" % len(array_bb)
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "py id_in = %s<br />" % id_in
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
dict_to_epub_proc (file_epub,dict_aa)
#
#
print "*****<br />"
print "OK"
#
# ---------------------------------------------------------------
