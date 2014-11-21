#! /usr/bin/python
#
#	maria_python_update.py
#
#					Nov/14/2014
#
import	cgi
import	string
import	sys
import	mysql.connector
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
# --------------------------------------------------------
conn = mysql.connector.connect (host="localhost",db="city", \
			user="scott", passwd="tiger")
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
	print ("** check ccc ***<br />")
#
print ("** check ddd ***<br />")
conn.commit ()
#
cursor.close ()
conn.close ()
#
print ("OK<br />")
#
