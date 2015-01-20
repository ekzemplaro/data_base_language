#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	berkeley_python_read.py
#
#					Jan/06/2015
#
import	sys
import	json
import	string
from bsddb3 import db
#
#
print ("Content-type: text/json\n\n")
#
db_name = "/var/tmp/berkeley/cities.db";
#
#
adb = db.DB ()
adb.open (db_name,dbtype=db.DB_HASH)
dict_aa = {} 
for key in adb.keys ():
	json_str = adb[key].decode('utf-8')
	dict_aa[key.decode ('utf-8')] = json.loads (json_str)
#
json_str = json.dumps (dict_aa)
#
print	(json_str)
#
adb.close ()
#
