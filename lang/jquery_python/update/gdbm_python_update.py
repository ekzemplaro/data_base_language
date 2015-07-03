#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	gdbm_python_update.py
#
#						Jun/11/2015
#
# ----------------------------------------------------------------
import sys
import json
#
import	cgi
import	string
# import	anydbm
import	dbm
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from dbm_manipulate import dbm_update_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
db_name = "/var/tmp/gdbm/cities.db";
# dd = anydbm.open (db_name,"c")
dd = dbm.open (db_name,"c")
#
# -------------------------------------------------------------------
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
	dbm_update_proc	(dd,id_in,population_in)
#
#
dd.close ()
#
print ("OK<br />")
#
