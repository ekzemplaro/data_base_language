#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_python_read.py
#
#					Nov/05/2010
#
# ----------------------------------------------------------------
import	sys
import	string
import	pymongo
#
sys.path.append ('/var/www/uchida/data_base/python_common')
from mongo_manipulate import mongo_to_json_proc
# ----------------------------------------------------------------
#
#
print "Content-type: text/json\n\n"
#
connection = pymongo.Connection("cpt003", 27017)
db = connection.city_db
#
str_aa = mongo_to_json_proc (db)
#
print	str_aa
# ----------------------------------------------------------------
