#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_python_update.py
#
#						Aug/05/2018
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
from mongo_manipulate import mongo_update_proc
from cgi_manipulate import parse_parameter
# ----------------------------------------------------------------
client = pymongo.MongoClient(username='scott',password='tiger123')
db = client['city']
collection = 'saitama'
#
# -------------------------------------------------------------------
#
print ("Content-type: text/html\n\n")
#
array_bb = parse_parameter ()
#
for it in range (len(array_bb)):
	id_in = array_bb[it]['id']
	population_in = int (array_bb[it]['population'])
	print("id_in = %s<br />" % id_in)
	print("population_in = %d<br />" % population_in)
	mongo_update_proc(db,collection,id_in,population_in)
#
#
print ("OK<br />")
#
# ---------------------------------------------------------------
