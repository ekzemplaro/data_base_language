#! /usr/bin/python
#
#	maria_python_delete.py
#
#					Dec/26/2013
#
import	cgi
import	string
import	sys
import	MySQLdb
#
import	json
#
#
sys.path.append ('/var/www/data_base/common/python_common')
# -------------------------------------------------------------------
#
from sql_manipulate import sql_delete_proc
from cgi_manipulate import parse_parameter
from mysql_utf8 import mysql_utf8_proc
#
#
# --------------------------------------------------------
conn = MySQLdb.connect (host="localhost",db="city", \
			user="scott", passwd="tiger")
#
cursor = conn.cursor ()
#
mysql_utf8_proc (cursor)
# --------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "id_in = %s<br />" % id_in
	sql_delete_proc	(cursor,id_in)
	print "check cccccc<br />"
#
conn.commit ()
#
cursor.close ()
conn.close ()
#
#
print "OK<br />"
#
