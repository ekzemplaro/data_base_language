# -*- coding: utf-8 -*-
#
#	mongo_delete.pyx
#
#					Sep/14/2015
#
import	sys
import	string
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_delete_proc
# -------------------------------------------------------------------
print	("*** 開始 ***") 
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
client = pymongo.MongoClient()
db = client['city_db']
#
mongo_delete_proc (db,id_in)
#
print	("*** 終了 ***") 
#
