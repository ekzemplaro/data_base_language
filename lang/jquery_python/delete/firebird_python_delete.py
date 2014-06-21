#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_python_delete.py
#
#						May/09/2013
#
#
import sys
import kinterbasdb
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from sql_manipulate import sql_delete_proc
from cgi_manipulate import parse_parameter
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
		user="sysdba", password="tiger")	
#
cursor = conn.cursor ()
#
#
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
