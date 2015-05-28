#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mongo_create.rb
#					Sep/02/2013
#
# --------------------------------------------------------
include Java
import com.mongodb.DB
import com.mongodb.Mongo
import com.mongodb.DBCollection
import com.mongodb.DBCursor
import com.mongodb.BasicDBObject

# --------------------------------------------------------
require 'rubygems'
require 'json'
# --------------------------------------------------------
def mongo_create_proc (coll,key_in,name_in,population_in,date_mod_in)
	doc = BasicDBObject.new()

	doc.put("key",key_in)
	doc.put("name",name_in)
	doc.put("population",population_in)
	doc.put("date_mod",date_mod_in)

	coll.insert(doc)
end
# --------------------------------------------------------
puts	"*** 開始 ***"
#
mm = Mongo.new("localhost",27017)
db = mm.getDB("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)


puts coll.getCount()


coll.drop()

mongo_create_proc(coll,"t1161","さいたま",49571,"2007-6-14")
mongo_create_proc(coll,"t1162","所沢",49286,"2007-5-27")
mongo_create_proc(coll,"t1163","越谷",26435,"2007-2-3")
mongo_create_proc(coll,"t1164","久喜",32641,"2007-9-14")
mongo_create_proc(coll,"t1165","熊谷",43783,"2007-3-17")
mongo_create_proc(coll,"t1166","秩父",75293,"2007-7-21")
mongo_create_proc(coll,"t1167","川越",92476,"2007-8-9")
mongo_create_proc(coll,"t1168","和光",19421,"2007-1-4")
mongo_create_proc(coll,"t1169","新座",53479,"2007-2-18")

puts "*** 終了 ***"


# --------------------------------------------------------
