#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mongo_delete.py
#					Sep/10/2015
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
from com.mongodb import MongoClient

from com.mongodb import BasicDBObject
from org.bson import Document
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
print ("%s" % key_in)
#
mm = MongoClient ("localhost",27017)
db = mm.getDatabase ("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)

print (coll.count())
coll.deleteMany (Document("key", key_in))

print (coll.count())
#
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
