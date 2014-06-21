#! /usr/bin/python
#
#	xlsx_python_update.py
#
#					Aug/19/2013
#
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from xlsx_manipulate import xlsx_read_proc
from xlsx_manipulate import xlsx_write_proc
from text_manipulate import dict_update_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
xlsx_file = "/var/tmp/xlsx/cities.xlsx"
dict_aa = xlsx_read_proc (xlsx_file)
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
xlsx_write_proc (xlsx_file,dict_aa)
#
print "check vvvvvvv<br />"
#

print "*****<br />"
print "OK"
#
# ---------------------------------------------------------------
