#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mongo_read.rb
#					Sep/02/2013
#
# --------------------------------------------------------
include Java
import com.mongodb.DB
import com.mongodb.Mongo
import com.mongodb.DBCollection
import com.mongodb.DBCursor

# --------------------------------------------------------
require 'rubygems'
require 'json'
# --------------------------------------------------------
puts	"*** 開始 ***"

mm = Mongo.new("localhost",27017)
db = mm.getDB("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)


puts coll.getCount()

cursor = coll.find()

while cursor.hasNext() do
	data = cursor.next()
	unit_aa=JSON.parse(data.to_s)
	print(unit_aa['key'],"\t")
	print(unit_aa['name'],"\t")
	print(unit_aa['population'],"\t")
	print(unit_aa['date_mod'],"\n")
	end

puts "*** 終了 ***"
# --------------------------------------------------------
