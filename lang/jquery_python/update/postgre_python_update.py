#! /usr/bin/python
#
#	postgre_python_update.py
#
#					Sep/06/2016
#
# -------------------------------------------------------------------
import cgi
import string
import sys
import psycopg2
#
import json
#
#
# -------------------------------------------------------------------
sys.path.append ('/var/www/data_base/common/python_common')
#
from sql_manipulate import sql_update_proc
from cgi_manipulate import parse_parameter
#
#
# --------------------------------------------------------
conn = psycopg2.connect("dbname=city user=scott password=tiger")
cur = conn.cursor()
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
	sql_update_proc	(cur,id_in,population_in)
#
conn.commit ()
#
cur.close ()
conn.close ()
#
#
print ("OK<br />")
#
