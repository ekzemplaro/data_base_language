#! /usr/bin/ruby
#
#	cassandra_read_ruby.rb
#
#					May/11/2010
require 'rubygems'
require 'cassandra'
include Cassandra::Constants
#
load '/var/www/uchida/data_base/common/ruby_common/cassandra_manipulate.rb'
# ---------------------------------------------------------------------
#
cities = Cassandra.new('Keyspace1')
#
str_out = cassandra_to_json_proc (cities)
#
#
puts "Content-type: text/json\n\n"
puts str_out
#
