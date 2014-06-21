#! /usr/bin/python
#
#	cdb_python_update.py
#
#					Mar/26/2013
#
import	math
import	cgi
import	string
import	sys
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from cdb_manipulate import cdb_read_proc
from cdb_manipulate import cdb_write_proc
from text_manipulate import dict_update_proc
from cgi_manipulate import parse_parameter
# ---------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
file_cdb = "/var/tmp/cdb/cities.cdb"
dict_aa = cdb_read_proc (file_cdb)
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
cdb_write_proc (file_cdb,dict_aa)
#
print "check vvvvvvv<br />"
#

print "*****<br />"
print "Mar/26/2013<p />"
print "OK"
#
# ---------------------------------------------------------------
