#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mongo_update.py
#					Sep/02/2013
#
# ----------------------------------------------------------------
#
import sys
import string
import	datetime
from time import localtime,strftime
import java
#
from java.lang import	System
from java.lang import	String
#
from com.mongodb import Mongo
from com.mongodb import BasicDBObject
#
# ----------------------------------------------------------------
def mongo_update_proc (coll,key_in,population_in):
	query = BasicDBObject()
	query.put("key",key_in)
	cur = coll.find(query)
	print (cur.count ())

	name_aa = ""	
	while(cur.hasNext()):
		obj = cur.next ()
#		name_aa = str (obj.get ("name"))
		name_aa = obj.get ("name")
#
#	print name_aa
	doc = BasicDBObject()
	doc.put("key",key_in)
	doc.put("name",name_aa)
	doc.put("population",population_in)
	str_ddx = strftime ("%Y-%m-%d",localtime ())
	doc.put("date_mod",str_ddx)
	coll.update (query,doc)
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
key_in = sys.argv[1]
population_in = string.atoi (sys.argv[2])
print ("%s\t%d" % (key_in, population_in))
#
mm = Mongo ("localhost",27017)
db = mm.getDB ("city_db" )
col_name = "saitama"
coll = db.getCollection(col_name)

mongo_update_proc (coll,key_in,population_in)

print coll.getCount()
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
