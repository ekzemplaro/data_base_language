#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_python_delete.py
#
#						Jan/06/2015
#
import sys
import json
#
import	cgi
import	string
from bsddb3 import db
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from dbm_manipulate import dbm_delete_proc
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
	id_in = array_bb[it]
	print ("id_in = %s<br />" % id_in)
	dbm_delete_proc	(adb,id_in)
#
#
adb.close ()
#
print ("OK<br />")
#
