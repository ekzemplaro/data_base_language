#! /usr/bin/python
#
#	csv_python_update.py
#
#					Jun/10/2011
#
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import csv_read_proc
from text_manipulate import csv_write_proc
from text_manipulate import dict_update_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
file_in = "/var/tmp/csv/cities.csv"
dict_aa = csv_read_proc (file_in)
#
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
csv_write_proc (file_in,dict_aa)
#
print "check vvvvvvv<br />"
#

print "*****<br />"
print "May/11/2011<p />"
print "OK"
#
# ---------------------------------------------------------------
