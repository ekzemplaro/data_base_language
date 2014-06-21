#! /usr/bin/ruby
#
#	read/mongo_read.rb
#
#					May/10/2010
#
require 'rubygems'
require 'mongo'
require "json"
include Mongo
#
load '/var/www/uchida/data_base/common/ruby_common/mongo_manipulate.rb'
# ---------------------------------------------------------------------
#
print "*** start ***\n"
db_name = 'city_db'
col_name = 'my_collection'
db   = Connection.new("cpt003",27017).db(db_name)
#
coll = db.collection(col_name)
#
print "col.count = ",coll.count(),"\n"
#
mongo_display_proc (coll)
#
print coll,"\n"
#
coll.find().each { |row|
	print row,"\n"
	}
#
json_str = mongo_to_json_proc (coll)
print json_str, "\n"
print "*** end ***\n"
# ---------------------------------------------------------------------
