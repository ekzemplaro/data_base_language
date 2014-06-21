#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_read.py
#
#				Sep/02/2013
#
import	sys
import pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_display_proc
# -------------------------------------------------------------------
#
print	"*** 開始 ***\n" 
#
connection = pymongo.Connection("localhost", 27017)
db = connection.city_db
#
mongo_display_proc (db)
#
print	"*** 終了 ***\n" 
# -------------------------------------------------------------------
