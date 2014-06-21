#! /usr/bin/python
#
#	drizzle_python_delete.py
#
#					Jul/09/2012
#
import	math
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
from drizzle_manipulate import drizzle_delete_proc
from cgi_manipulate import parse_parameter
#
#
# --------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
db_name = "city"
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "id_in = %s<br />" % id_in
	drizzle_delete_proc	(db_name,id_in)
	print "check cccccc<br />"
#
#
print "OK<br />"
#
