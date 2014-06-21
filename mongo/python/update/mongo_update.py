#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_update.py
#
#					Sep/02/2013
#
import	sys
import	string
import	pymongo
import	datetime
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_display_proc
from mongo_manipulate import mongo_update_proc
# -------------------------------------------------------------------
print	"*** 開始 *** mongo_update.py ***\n" 
#
key_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
connection = pymongo.Connection("localhost", 27017)
db = connection.city_db
#
mongo_update_proc (db,key_in,population_in)
#
mongo_display_proc (db)
#
print	"*** 終了 ***\n" 
# -------------------------------------------------------------------
