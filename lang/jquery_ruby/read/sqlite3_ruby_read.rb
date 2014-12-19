#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	read/sqlite3_read_ruby.rb
#
#					Dec/09/2014
#
require 'sqlite3'
require	'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
#
dict_aa={}
db = SQLite3::Database.new("/var/tmp/sqlite3/cities.db")
db.execute('select ID, Name, Population, Date_Mod from cities') do |row|
#
	city={}
	key=row[0]
	city["name"]=row[1]
	city["population"]=row[2]
	city["date_mod"]=row[3]
	dict_aa[key]=city
end
#
db.close
#
#
puts "Content-type: text/json\n\n"
#
#json_out = JSON.pretty_generate(dict_aa)
json_out = JSON.generate(dict_aa)
#
puts json_out
#
#
