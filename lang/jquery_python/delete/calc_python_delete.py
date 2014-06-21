#! /usr/bin/python
#
#	calc_python_delete.py
#
#					Jun/26/2012
#
# ---------------------------------------------------------------
import	sys
reload(sys)
sys.setdefaultencoding('utf-8')
import	math
import	cgi
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from calc_manipulate import calc_read_proc
from calc_manipulate import calc_write_proc
from text_manipulate import dict_delete_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
print "*** start *** calc_python_delete.py ***<br />"
#
file_calc = "/var/tmp/calc/cities.ods"
dict_aa=calc_read_proc (file_calc)
#
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
	dict_aa = dict_delete_proc (dict_aa,id_in)
#
calc_write_proc (file_calc,dict_aa)
#
#
print "*****<br />"
print "OK"
#
# ---------------------------------------------------------------
