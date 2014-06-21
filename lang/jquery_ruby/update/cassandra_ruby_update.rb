#! /usr/bin/ruby
#
#	cassandra_ruby_update.rb
#
#					Jun/09/2011
#
require	'rubygems'
require 'date'
require	"cgi"
require	"json"
require 'cassandra'
include Cassandra::Constants
#
load '/var/www/data_base/common/ruby_common/cassandra_manipulate.rb'
#
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** cassandra_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
#
cities = Cassandra.new('Cities')
#
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	cassandra_update_proc(cities,id,population)
	print id,population,"<br />" 
end
#
#
print "*** end ***<p />"
