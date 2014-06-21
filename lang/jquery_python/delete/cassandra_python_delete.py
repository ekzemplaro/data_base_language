#! /usr/bin/python
#
#	cassandra_python_delete.py
#
#					Sep/06/2013
#
# -------------------------------------------------------------------
import	cgi
import	string
import	sys
import	json
import	cql
#
sys.path.append ('/var/www/data_base/common/python_common')
from cgi_manipulate import parse_parameter
from cassandra_manipulate import cassandra_delete_proc
#
# --------------------------------------------------------
host = 'localhost'
port = 9160
keyspace = 'city'
conn = cql.connect (host,port,keyspace,cql_version='3.0.0')
#
cursor = conn.cursor ()
#
# --------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	key_in = array_bb[it]
	print "key_in = %s<br />" % key_in
	print "check cccccc<br />"
	cassandra_delete_proc (cursor,key_in)
	print "check dddddd<br />"
#
#conn.commit ()
#
cursor.close ()
conn.close ()
#
#
print "OK<br />"
#
