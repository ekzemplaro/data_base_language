#! /usr/bin/python
#
#	epub_python_update.py
#
#					Jul/09/2012
#
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_update_proc
from epub_manipulate import epub_to_dict_proc
from epub_manipulate import dict_to_epub_proc
#
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
file_epub = "/var/tmp/epub/cities.epub"
print "*** check *** aaa\n"
dict_aa = epub_to_dict_proc (file_epub)
#
print "*** check *** ccc\n"
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "id_in = %s<br />" % id_in
	print "population_in = %d<br />" % population_in
	dict_aa = dict_update_proc (dict_aa,id_in,population_in)
#
#
dict_to_epub_proc (file_epub,dict_aa)
#
print "check vvvvvvv<br />"
#

print "*****<br />"
print "OK"
#
# ---------------------------------------------------------------
