#! /usr/bin/python
#
#	derby_python_update.py
#
#					Jul/09/2012
#
import	cgi
import	string
import	sys
#
import	json
#
#
sys.path.append ('/var/www/data_base/common/python_common')
# -------------------------------------------------------------------
#
from derby_manipulate import derby_update_proc
from cgi_manipulate import parse_parameter
#
#
# --------------------------------------------------------
print "Content-type: text/html\n\n"
#
db_name = "city_aaa"
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "id_in = %s<br />" % id_in
	print "population_in = %d<br />" % population_in
	print "check bbbbbbb<br />"
	derby_update_proc	(db_name,id_in,population_in)
	print "check cccccc<br />"
#
#
print "OK<br />"
#
