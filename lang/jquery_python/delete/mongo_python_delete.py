#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_python_delete.py
#
#						Aug/05/2018
#
#
# ----------------------------------------------------------------
import sys
import json
#
import	cgi
import	string
import	pymongo
#
sys.path.append ("/var/www/data_base/common/python_common")
#
from mongo_manipulate import mongo_delete_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
client = pymongo.MongoClient(username='scott',password='tiger123')
db = client['city']
collection = 'saitama'
#
# -------------------------------------------------------------------
#
print("Content-type: text/html\n\n")
#
# ---------------------------------------------------------------
array_bb = parse_parameter()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]
	print("id_in = %s<br />" % id_in)
	mongo_delete_proc(db,collection,id_in)
#
print("OK<br />")
#
