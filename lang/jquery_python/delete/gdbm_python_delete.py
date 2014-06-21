#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	gdbm_python_delete.py
#
#						Jul/20/2011
#
#
import sys
import json
#
import	cgi
import	string
import	anydbm
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from dbm_manipulate import dbm_delete_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
db_name = "/var/tmp/gdbm/cities.pag";
dd = anydbm.open (db_name,"c")
#
# -------------------------------------------------------------------
#
print "Content-type: text/html\n\n"
#
# ---------------------------------------------------------------
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print "id_in = %s<br />" % id_in
	dbm_delete_proc	(dd,id_in)
	print "check cccccc<br />"
#
#
dd.close ()
#
print "OK<br />"
#
