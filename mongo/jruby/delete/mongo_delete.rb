#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mongo_delete.rb
#					Sep/11/2015
#
# --------------------------------------------------------
include Java

import com.mongodb.MongoClient
import com.mongodb.client.MongoDatabase
import com.mongodb.client.MongoCollection

import org.bson.Document


# --------------------------------------------------------
puts	"*** 開始 ***"

key_in = ARGV[0]
#
puts key_in
#
mm = MongoClient("localhost",27017)
db = mm.getDatabase("city_db")

col_name = "saitama"

coll = db.getCollection(col_name)

puts coll.count()

coll.deleteMany(Document("key", key_in))

puts coll.count()

puts "*** 終了 ***"
# --------------------------------------------------------
