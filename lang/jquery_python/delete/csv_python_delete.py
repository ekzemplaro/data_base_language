#! /usr/bin/python
#
#	csv_python_delete.py
#
#					Jul/20/2011
#
# ---------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import csv_write_proc
from text_manipulate import dict_delete_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
print "*** start *** csv_python_delete.py ***<br />"
#
file_in = "/var/tmp/csv/cities.csv"
#
dict_aa=csv_read_proc (file_in)
#
print "*** bbbb *** text_python_delete.py ***<br />"
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "py id_in = %s<br />" % id_in
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
csv_write_proc (file_in,dict_aa)
#
print "check vvvvvvv<br />"
#

print "*****<br />"
print "May/11/2011<p />"
print "OK"
#
# ---------------------------------------------------------------
