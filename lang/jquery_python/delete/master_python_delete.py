#! /usr/bin/python
#
#	master_python_update.py
#
#					Jul/09/2010
#
import	math
import	cgi
import	string
import	sys
import	json
#
#
# ---------------------------------------------------------------
sys.path.append ('/var/www/uchida/data_base/common/python_common')
from cgi_manipulate import parse_parameter
#
#
print "Content-type: text/html\n\n"
#
#
array_bb = parse_parameter ()
#
print "len(array_bb) = %d<p />\n" % len(array_bb)
#
for it in range (len(array_bb)):
	print array_bb[it]
	print "<br />"
	print array_bb[it]['id']
	print "<br />"
#
#
print "*****<br />"
print "Apr/14/2010<p />"
print "OK"
#
