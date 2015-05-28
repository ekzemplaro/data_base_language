#! /usr/bin/python
# -*- coding: utf-8 -*-
#
#	mongo_update.py
#
#					May/12/2015
#
import	sys
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_update_proc
# -------------------------------------------------------------------
print	("*** 開始 *** mongo_update.py ***\n")
#
key_in = sys.argv[1]
population_in = int (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
client = pymongo.MongoClient()
db = client['city_db']
#
mongo_update_proc (db,key_in,population_in)
#
print	("*** 終了 ***\n")
# -------------------------------------------------------------------
