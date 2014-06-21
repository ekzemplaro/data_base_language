#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_read.py
#
#				May/10/2010
#
import	sys
import pymongo
#
sys.path.append ('/var/www/uchida/data_base/common/python_common')
from mongo_manipulate import mongo_display_proc
from mongo_manipulate import mongo_to_json_proc
# -------------------------------------------------------------------
#
print	"*** start ***\n" 
#
print sys.path
#
connection = pymongo.Connection("cpt003", 27017)
db = connection.city_db
#
mongo_display_proc (db)
#
str_json = mongo_to_json_proc (db)
print str_json
print	"*** end ***\n" 
# -------------------------------------------------------------------
