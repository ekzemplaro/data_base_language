#! /usr/bin/python
#
#	mssql_python_delete.py
#
#					Jul/20/2011
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
	(host='cdbd025\SQLEXPRESS',user='sa',password='hello9',database='city')
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
