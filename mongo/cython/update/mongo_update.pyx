#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_update.py
#
#					Jun/25/2012
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
id_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (id_in, population_in))
#
connection = pymongo.Connection("localhost", 27017)
db = connection.city_db
#
mongo_update_proc (db,id_in,population_in)
#
print	"*** 終了 ***\n" 

