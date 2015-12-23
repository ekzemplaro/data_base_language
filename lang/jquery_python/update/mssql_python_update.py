#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mssql_python_update.py
#
#					Nov/19/2015
#
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
from sql_manipulate import sql_update_proc
from cgi_manipulate import parse_parameter
#
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
	id_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print ("id_in = %s<br />" % id_in)
	print ("population_in = %d<br />" % population_in)
	sql_update_proc	(cursor,id_in,population_in)
#
conn.commit ()
#
cursor.close ()
conn.close ()
#
#
print ("OK<br />")
#
