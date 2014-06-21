#! /usr/bin/python
#
#	cassandra_python_update.py
#
#					Sep/06/2013
#
import	cgi
import	string
import	sys
import	datetime
import	cql
#
import	json
#
#
sys.path.append ('/var/www/data_base/common/python_common')
# -------------------------------------------------------------------
#
from cassandra_manipulate import cassandra_update_proc
from cgi_manipulate import parse_parameter
#
#
# --------------------------------------------------------
host = 'localhost'
port = 9160
keyspace = 'city'
con = cql.connect (host,port,keyspace,cql_version='3.0.0')
cursor = con.cursor()
#
# --------------------------------------------------------
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
	print "check bbbbbbb<br />"
	cassandra_update_proc	(cursor,id_in,population_in)
	print "check cccccc<br />"
#
#conn.commit ()
#
cursor.close ()
conn.close ()
#
#
print "OK<br />"
#
