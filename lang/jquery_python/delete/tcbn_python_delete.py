#! /usr/bin/python
#
#	tcbn_python_delete.py
#
#					Jun/27/2012
#
# ---------------------------------------------------------------
import	math
import	cgi
import	string
import	sys
import	json
import	pytc
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_delete_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
print "*** start *** dbm_python_delete.py ***<br />"
#
file_tcbn = "/var/tmp/tokyo_cabinet/cities.tcb"
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
#
print "*** bbbb *** dbm_python_delete.py ***<br />"
#
array_bb = parse_parameter ()
#
print "*** cccc *** text_python_delete.py ***<br />"
print "*** len(array_bb) =  %d text_python_delete.py ***<br />" % len(array_bb)
print "*** dccc *** text_python_delete.py ***<br />"
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "py id_in = %s<br />" % id_in
	dbm_delete_proc	(db,id_in)
#
db.close ()
#
print "check vvvvvvv<br />"
#

print "*****<br />"
print "May/11/2011<p />"
print "OK"
#
# ---------------------------------------------------------------
