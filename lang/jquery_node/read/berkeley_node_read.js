#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_python_read.py
#
#					Jul/09/2010
#
import	sys
import	json
import	string
import	anydbm
#
sys.path.append ("/var/www/uchida/data_base/python_common")
from dbm_manipulate import dbm_to_json_proc
#
#print "Content-type: text/html\n\n"
#print "Hello<br />"
#
print "Content-type: text/json\n\n"
#
db_name = "/var/tmp/berkeley/cities";
#
dd = anydbm.open (db_name,"c")
#
json_str = dbm_to_json_proc (dd)
#
print	json_str
#
dd.close ()
#
#
#
