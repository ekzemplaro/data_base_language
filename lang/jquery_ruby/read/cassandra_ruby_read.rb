#! /usr/bin/ruby
#
#	cassandra_read_ruby.rb
#
#					Jun/09/2011
require 'rubygems'
require 'cassandra'
include Cassandra::Constants
#
load '/var/www/data_base/common/ruby_common/cassandra_manipulate.rb'
# ---------------------------------------------------------------------
#
cities = Cassandra.new('Cities')
#
str_out = cassandra_to_json_proc(cities)
#
#
puts "Content-type: text/json\n\n"
puts str_out
#
