# -*- coding: utf-8 -*-
#
#	mongo_delete.pyx
#
#					Jun/25/2012
#
import	sys
import	string
import	pymongo
#
sys.path.append ('/var/www/data_base/common/python_common')
from mongo_manipulate import mongo_delete_proc
# -------------------------------------------------------------------
print	"*** 開始 *** mongo_delete.py ***\n" 
#
id_in = sys.argv[1]
print ("%s" % id_in)
#
connection = pymongo.Connection("localhost", 27017)
db = connection.city_db
#
mongo_delete_proc (db,id_in)
#
print	"*** 終了 ***\n" 
#
