#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_python_update.py
#
#						Jan/06/2015
#
#
import sys
import json
from bsddb3 import db
#
import	cgi
import	string
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from dbm_manipulate import dbm_update_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
db_name = "/var/tmp/berkeley/cities.db";
adb = db.DB ()
adb.open (db_name)
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
	dbm_update_proc	(adb,id_in,population_in)
#
#
adb.close ()
#
print ("OK<br />")
#
