#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_delete.py
#
#					Sep/02/2013
#
import	sys
import	string
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_display_proc
from mongo_manipulate import mongo_delete_proc
# -------------------------------------------------------------------
print	"*** 開始 *** mongo_delete.py ***\n" 
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
connection = pymongo.Connection("localhost", 27017)
db = connection.city_db
#
mongo_delete_proc (db,key_in)
#
mongo_display_proc (db)
#
print	"*** 終了 ***\n" 
#
