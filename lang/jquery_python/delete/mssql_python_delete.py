#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mssql_python_delete.py
#
#					Mar/10/2015
#
import	math
import	cgi
import	string
import	sys
import	pymssql
#
import	json
#
#
sys.path.append ('/var/www/data_base/common/python_common')
# -------------------------------------------------------------------
#
from sql_manipulate import sql_delete_proc
from cgi_manipulate import parse_parameter
#
#
# --------------------------------------------------------
conn = pymssql.connect \
	(host='host_mssql',user='sa',password='scott_tiger',database='city')
#
cursor = conn.cursor ()
#
# --------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
# ---------------------------------------------------------------
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
print ("OK<br />")
#
# ---------------------------------------------------------------
