#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	cdb_python_read.py
#
#						Mar/26/2013
#
#
# ---------------------------------------------------------------------
import	sys
import	string
import	json
#
sys.path.append ('/var/www/data_base/common/python_common')
from cdb_manipulate import cdb_read_proc
# ---------------------------------------------------------------------
#
file_cdb = "/var/tmp/cdb/cities.cdb"
#
dict_aa = cdb_read_proc (file_cdb)
str_aa = json.dumps (dict_aa)
#
print "Content-type: text/json\n\n"
print	str_aa
