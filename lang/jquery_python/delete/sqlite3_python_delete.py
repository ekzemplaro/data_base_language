#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	sqlite3_python_delete.py
#
#					Sep/09/2014
#
# -------------------------------------------------------------------
import	cgi
import	string
import	sys
import	sqlite3
#
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from sql_manipulate import sql_delete_proc
from cgi_manipulate import parse_parameter
# -------------------------------------------------------------------
#
conn = sqlite3.connect ("/var/tmp/sqlite3/cities.db")
#
cursor = conn.cursor ()
#
print ("Content-type: text/html\n\n")
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print ("id_in = %s<br />" % id_in)
	sql_delete_proc	(cursor,id_in)
#
conn.commit ()
#
cursor.close ()
conn.close ()
#
#
print ("*** OK ***<br />")
#
# -------------------------------------------------------------------
