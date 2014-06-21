#! /usr/bin/ruby
#
#	cassandra_ruby_update.rb
#
#					May/11/2010
#
require	'rubygems'
require 'date'
require	"cgi"
require	"json"
require 'cassandra'
include Cassandra::Constants
#
load '/var/www/uchida/data_base/common/ruby_common/cassandra_manipulate.rb'
#
#
load '/var/www/uchida/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/uchida/data_base/common/ruby_common/cgi_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** cassandra_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
#
cities = Cassandra.new('Keyspace1')
#
#
hhh.each do |unit|
	id = unit["id"].to_i
	population=unit["population"].to_i
	cassandra_update_proc(cities,id,population)
	print id,population,"<br />" 
end
#
#
print "*** end ***<p />"
