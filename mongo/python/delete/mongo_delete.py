#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_delete.py
#
#					May/12/2015
#
import	sys
import	string
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_delete_proc
# -------------------------------------------------------------------
print	("*** 開始 *** mongo_delete.py ***\n")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
client = pymongo.MongoClient()
db = client['city_db']
#
mongo_delete_proc (db,key_in)
#
print	("*** 終了 ***\n")
#
# -------------------------------------------------------------------
