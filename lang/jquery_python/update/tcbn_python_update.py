#! /usr/bin/python
#
#	tcbn_python_update.py
#
#					Jun/27/2012
#
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	math
import	cgi
import	string
import	json
import	pytc
#
sys.path.append ('/var/www/data_base/common/python_common')
from dbm_manipulate import dbm_update_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
file_tcbn = "/var/tmp/tokyo_cabinet/cities.tcb"
db = pytc.BDB(file_tcbn, pytc.BDBOWRITER | pytc.BDBOCREAT)
#
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = string.atoi (array_bb[it]['population'])
	print "id_in = %s<br />" % id_in
	print "population_in = %d<br />" % population_in
	print "check *** ppp<br />"
	dbm_update_proc	(db,id_in,population_in)
	print "check *** qqq<br />"
#
db.close ()
#
#
print "check vvvvvvv<br />"
#
print "*** OK ***"
#
# ---------------------------------------------------------------
