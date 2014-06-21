#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mongo_delete.py
#					Sep/02/2013
#
# ----------------------------------------------------------------
#
import sys
import string
import java
#
from java.lang import	System
from java.lang import	String
#
from com.mongodb import Mongo
from com.mongodb import BasicDBObject
#
# ----------------------------------------------------------------
def mongo_delete_proc (coll,key_in):
	print ("%s" % key_in)
	query = BasicDBObject()
	query.put("key",key_in)
	cur = coll.find(query)
	print (cur.count ())
	coll.remove (query)
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
mm = Mongo ("localhost",27017)
db = mm.getDB ("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)

mongo_delete_proc (coll,key_in)

print coll.getCount()
#
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
