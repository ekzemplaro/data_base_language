#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mongo_read.py
#					Sep/10/2015
#
# ----------------------------------------------------------------
#
import sys
#
from java.lang import	System
from java.lang import	String
#
import java
#
from com.mongodb import MongoClient
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
mm = MongoClient ("localhost",27017)
db = mm.getDatabase ("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)


print coll.count()

iterable = coll.find()

iterable.forEach(Block<Document>()
#	@Override
#	public void apply(final Document doc):
	apply(final Document doc):
		key = doc.get ("key")
		name = doc.get ("name")
		population = doc.get ("population")
		date_mod = doc.get ("date_mod")
		dict_aa = text_manipulate.dict_append_proc (dict_aa,key,name,population,date_mod)

#
print ("*** 終了 ***")
# ----------------------------------------------------------------
