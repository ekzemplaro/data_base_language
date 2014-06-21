#! /usr/bin/jython
# -*- coding: utf-8 -*-
#
#	mongo_create.py
#					Jun/04/2014
#
# ----------------------------------------------------------------
import sys
sys.path.append ('/var/www/data_base/common/python_common')
from text_manipulate import dict_append_proc
#
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
def	data_prepare_proc ():
	dict_aa = {} 
#
	dict_aa = dict_append_proc (dict_aa,'t1161',u'さいたま',62184,'2004-4-21')
	dict_aa = dict_append_proc (dict_aa,'t1162',u'所沢',17825,'2004-5-12')
	dict_aa = dict_append_proc (dict_aa,'t1163',u'越谷',72694,'2004-6-17')
	dict_aa = dict_append_proc (dict_aa,'t1164',u'久喜',69412,'2004-9-9')
	dict_aa = dict_append_proc (dict_aa,'t1165',u'熊谷',47371,'2004-8-4')
	dict_aa = dict_append_proc (dict_aa,'t1166',u'秩父',35187,'2004-1-21')
	dict_aa = dict_append_proc (dict_aa,'t1167',u'川越',81296,'2004-7-23')
	dict_aa = dict_append_proc (dict_aa,'t1168',u'和光',24781,'2004-10-26')
	dict_aa = dict_append_proc (dict_aa,'t1169',u'新座',75823,'2004-12-15')
#
	return	dict_aa
#
# ----------------------------------------------------------------
def dict_to_mongo_proc (coll,dict_aa):
	for key in dict_aa.keys():
		unit = dict_aa[key]
		doc = BasicDBObject()
		doc.put("key",key)
		doc.put("name",unit['name'])
		doc.put("population",unit['population'])
		doc.put("date_mod",unit['date_mod'])
		coll.insert (doc)
# ----------------------------------------------------------------
print ("*** 開始 ***")
#
dict_aa = data_prepare_proc ()
#
mm = Mongo ("localhost",27017)
db = mm.getDB ("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)

coll.drop ()
dict_to_mongo_proc (coll,dict_aa)

print coll.getCount()

print ("*** 終了 ***")
# ----------------------------------------------------------------
