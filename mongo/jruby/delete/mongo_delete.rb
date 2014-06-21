#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mongo_delete.rb
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
puts	"*** 開始 ***"

key_in = ARGV[0]
#
puts key_in
#
mm = Mongo.new("localhost",27017)
db = mm.getDB("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)


puts coll.getCount()


query = BasicDBObject.new()
query.put("key", key_in)
coll.remove(query)

puts "*** 終了 ***"
# --------------------------------------------------------
