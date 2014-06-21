#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	cassandra_update.rb
#
#					Sep/06/2013
#require 'rubygems'
require 'cassandra-cql'
require 'date'

#load '/var/www/data_base/common/ruby_common/cassandra_manipulate.rb'
# --------------------------------------------------------------------
print "*** 開始 ***\n"

key = ARGV[0]
population_in = ARGV[1].to_i
#
puts key,population_in

db = CassandraCQL::Database.new('127.0.0.1:9160', {:keyspace => 'city'})

today=Date.today.to_s
sql_str="update cities set population='#{population_in}', date_mod='#{today}' where key = '#{key}'"
sql_str="update cities set population='#{population_in}' where key = '#{key}'"

puts sql_str
db.execute(sql_str)
#
print "*** 終了 ***\n"
#
