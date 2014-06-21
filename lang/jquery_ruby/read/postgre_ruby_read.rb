#! /usr/bin/ruby1.8
#
#	postgre_read_ruby.rb
#
#					Apr/25/2011
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/sql_to_json.rb'
#
#
dbi=DBI.connect("dbi:Pg:city:localhost","scott","tiger")
#
str_out = sql_to_json_proc(dbi)
#
puts "Content-type: text/json\n\n"
puts str_out
#
