#! /usr/bin/python
#
#	calc_python_update.py
#
#					Jun/26/2012
#
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
from text_manipulate import dict_update_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
calc_file = "/var/tmp/calc/cities.ods"
dict_aa = calc_read_proc (calc_file)
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
	print "check calc ppp ***<br />"
#
print "check calc qqq ***<br />"
#
calc_write_proc (calc_file,dict_aa)
#
print "check calc rrr ***<br />"
#

print "*****<br />"
print "OK"
#
# ---------------------------------------------------------------
