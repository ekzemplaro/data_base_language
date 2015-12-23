#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_python_delete.py
#
#					Nov/19/2015
#
# -------------------------------------------------------------------
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
# --------------------------------------------------------
server_mssql = 'host_mssql\EG'
user_mssql = 'sa'
password_mssql = 'Tiger123'
#
conn = pymssql.connect \
	(host=server_mssql,user=user_mssql,password=password_mssql,database='city')
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
