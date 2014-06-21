#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_python_read.py
#
#					May/30/2011
#
import	sys
import	json
import	string
import	anydbm
#
sys.path.append ("/var/www/data_base/common/python_common")
from dbm_manipulate import dbm_to_dict_proc
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
dict_aa = dbm_to_dict_proc (dd)
json_str = json.dumps (dict_aa)
#
print	json_str
#
dd.close ()
#
#
#
