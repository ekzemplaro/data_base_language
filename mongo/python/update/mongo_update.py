#! /usr/bin/python3
# -*- coding: utf-8 -*-
#
#	mongo_update.py
#
#					Jul/01/2018
#
import	sys
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_update_proc
# -------------------------------------------------------------------
sys.stderr.write ("*** 開始 ***\n")
#
key_in = sys.argv[1]
population_in = int (sys.argv[2])
sys.stderr.write ("%s\t%d\n" % (key_in, population_in))
#
client = pymongo.MongoClient(username='scott',password='tiger123')
db = client['city']
collection = 'saitama'
#
mongo_update_proc (db,collection,key_in,population_in)
#
sys.stderr.write ("*** 終了 ***\n")
# -------------------------------------------------------------------
