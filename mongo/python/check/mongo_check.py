#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_read.py
#
#				May/12/2015
#
import	sys
import pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_display_proc
# -------------------------------------------------------------------
#
print	("*** start ***\n")
#
print (sys.path)
#
client = pymongo.MongoClient()
db = client['city_db']
#
mongo_display_proc (db)
#
print	("*** end ***\n")
# -------------------------------------------------------------------
