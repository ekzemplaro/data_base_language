#! /usr/bin/python
#
#	json_python_update.py
#
#					Jun/10/2011
#
import	math
import	cgi
import	string
import	sys
#
import	json
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
from cgi_manipulate import parse_parameter
from text_manipulate import dict_update_proc
from file_io import file_to_str_proc
from file_io import file_write_proc
#
# -------------------------------------------------------------------
file_json = "/var/tmp/json/cities.json"
#
json_str = file_to_str_proc (file_json)
#
dict_aa = json.loads (json_str)
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "id_in = %s<br />" % id_in
	print "population_in = %d<br />" % population_in
	dict_update_proc (dict_aa,id_in,population_in)
#
out_str = json.dumps (dict_aa)
file_write_proc (file_json,out_str)
#
print "check vvvvvvv<br />"
#
print "OK"
#
