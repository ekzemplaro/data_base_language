#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mongo_ruby_delete.rb
#
#					May/12/2015
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
print "*** mongo_ruby_delete.rb ****<br />"
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
	print "*** check ***"
	id = unit
	print id" aaa<br />" 
	mongo_delete_proc(coll,id)
	print id"<br />" 
end
#
#
print "*** end ***<p />"
