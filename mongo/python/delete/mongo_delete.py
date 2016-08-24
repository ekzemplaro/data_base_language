#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mongo_delete.py
#
#					Aug/09/2016
#
import	sys
import	string
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_delete_proc
# -------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
key_in = sys.argv[1]
sys.stderr.write ("%s\n" % key_in)
#
client = pymongo.MongoClient()
db = client['city_db']
#
mongo_delete_proc (db,key_in)
#
sys.stderr.write ("*** 終了 ***\n")
#
# -------------------------------------------------------------------
