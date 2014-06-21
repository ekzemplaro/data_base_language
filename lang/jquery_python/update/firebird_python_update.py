#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	firebird_python_read.py
#
#						Jun/18/2012
#
#
import sys
import json
import kinterbasdb
import string
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from sql_manipulate import sql_update_proc
from cgi_manipulate import parse_parameter
#
#
conn = kinterbasdb.connect \
	(dsn='localhost:/var/tmp/firebird/cities.fdb', \
		user="sysdba", password="tiger")
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
	print "it = %d<br />" % it
	id_in = array_bb[it]['id']
	print "id_in = %s<br />" % id_in
	population_in = string.atoi (array_bb[it]['population'])
	print "check aaaa<br />"
	print "population_in = %d<br />" % population_in
	print "check bbbbbbb<br />"
	sql_update_proc	(cursor,id_in,population_in)
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
