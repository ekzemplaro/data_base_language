#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	berkeley_read.py
#
#					Jan/06/2015
import	sys
import json
from bsddb3 import db
import string
#
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_display_proc
# -------------------------------------------------------------
def db_to_dict_proc	(db_name):
	adb = db.DB ()
	adb.open (db_name,dbtype=db.DB_HASH)
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
print	("*** 開始 ***")
#
print (db.DB_VERSION_STRING + "\n")
db_name = sys.argv[1]
#
dict_aa = db_to_dict_proc (db_name)
#
dict_display_proc (dict_aa)
#
print	("*** 終了 ***")
#
# -------------------------------------------------------------
