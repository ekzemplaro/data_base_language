#! /usr/bin/ruby1.8
#
#	mongo_ruby_update.rb
#
#					Mar/18/2013
#
require	'rubygems'
require 'date'
require	"cgi"
require	"json"
require 'mongo'
include Mongo
#
load '/var/www/data_base/common/ruby_common/mongo_manipulate.rb'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** mongo_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
db_name = 'city_db'
col_name = 'saitama'
db = Connection.new("localhost",27017).db(db_name)
#
coll = db.collection(col_name)
#
#
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	mongo_update_proc(coll,id,population)
	print id,population,"<br />" 
end
#
#
print "*** end ***<p />"
