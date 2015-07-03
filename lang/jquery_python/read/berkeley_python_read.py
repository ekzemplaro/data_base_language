#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	berkeley_python_read.py
#
#					Jun/24/2015
#
import	sys
import	json
import	string
from bsddb3 import db
#
# -------------------------------------------------------------
def db_to_dict_proc	(db_name):
	adb = db.DB ()
#	adb.open (db_name,dbtype=db.DB_HASH)
	adb.open (db_name)
#
	dict_aa = {} 
	for key in adb.keys ():
		json_str = adb[key].decode('utf-8')
		dict_aa[key.decode ('utf-8')] = json.loads (json_str)
#
	adb.close ()
#
	return	dict_aa
# -------------------------------------------------------------
#
print ("Content-type: text/json\n\n")
#
db_name = "/var/tmp/berkeley/cities.db";
#
#
dict_aa = db_to_dict_proc (db_name)
#
json_str = json.dumps (dict_aa)
#
print	(json_str)
#
#
# -------------------------------------------------------------
