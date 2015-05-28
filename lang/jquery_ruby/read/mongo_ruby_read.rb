#! /usr/bin/ruby
#
#	mongo_read_ruby.rb
#
#					May/12/2015
require 'rubygems'
require 'mongo'
include Mongo
#
load '/var/www/data_base/common/ruby_common/mongo_manipulate.rb'
# ---------------------------------------------------------------------
#
db_name = 'city_db'
col_name = 'saitama'
db   = Connection.new("localhost",27017).db(db_name)
#
coll = db.collection(col_name)
#
str_out = mongo_to_json_proc(coll)
#
#
puts "Content-type: text/json\n\n"
puts str_out
#
