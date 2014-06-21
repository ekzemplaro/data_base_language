#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mongo_update.rb
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
require 'date'
# --------------------------------------------------------
puts	"*** 開始 ***"

key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in


mm = Mongo.new("localhost",27017)
db = mm.getDB("city_db" )

col_name = "saitama"

coll = db.getCollection(col_name)


puts coll.getCount()
query = BasicDBObject.new()
query.put("key", key_in)

cursor = coll.find(query)

name_aa = ""

while cursor.hasNext() do
	data = cursor.next()

	unit_aa=JSON.parse(data.to_s)

		puts "*** check ppp"
		puts	unit_aa['id']
	name_aa = unit_aa['name']
end
#
doc = BasicDBObject.new()
doc.put("key",key_in)
doc.put("name",name_aa)
doc.put("population",population_in)
str_ddx = Date.today.to_s()
puts str_ddx
doc.put("date_mod",str_ddx)
#
coll.update(query,doc)

puts "*** 終了 ***"

# --------------------------------------------------------
