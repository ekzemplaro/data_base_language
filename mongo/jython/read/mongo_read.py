#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mongo_read.py
#					Sep/02/2013
#
# ----------------------------------------------------------------
#
import sys
reload(sys)
sys.setdefaultencoding('utf-8')
#
from java.lang import	System
from java.lang import	String
#
import java
#
from com.mongodb import Mongo
#
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
mm = Mongo ("localhost",27017)
db = mm.getDB ("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)


print coll.getCount()

cursor = coll.find()

while(cursor.hasNext()):
	obj = cursor.next ()
	out_str = obj.get ("key") + "\t"
	out_str += obj.get ("name") + "\t"
	out_str += str (obj.get ("population")) + "\t"
	out_str += obj.get ("date_mod")
	print out_str
#
print ("*** 終了 ***")
# ----------------------------------------------------------------
