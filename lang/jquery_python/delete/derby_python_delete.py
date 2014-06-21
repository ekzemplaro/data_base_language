#! /usr/bin/python
#
#	derby_python_delete.py
#
#					Jul/09/2012
#
import	math
import	cgi
import	string
import	sys
import	os
#
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
# -------------------------------------------------------------------
from derby_manipulate import derby_delete_proc
from cgi_manipulate import parse_parameter
#
# --------------------------------------------------------
os.environ["DERBY_HOME"]="/usr/share/javadb"
#
print "Content-type: text/html\n\n"
#
db_name = "city_aaa"
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "id_in = %s<br />" % id_in
	derby_delete_proc	(db_name,id_in)
	print "check cccccc<br />"
#
#
print "*** OK ***<br />"
#
