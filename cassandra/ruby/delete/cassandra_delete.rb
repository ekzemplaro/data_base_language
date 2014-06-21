#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	cassandra_delete.rb
#
#					Sep/06/2013
#require 'rubygems'
require 'cassandra-cql'

#load '/var/www/data_base/common/ruby_common/cassandra_manipulate.rb'
# --------------------------------------------------------------------
print "*** 開始 ***\n"

key = ARGV[0]
#
puts key

db = CassandraCQL::Database.new('127.0.0.1:9160', {:keyspace => 'city'})

sql_str="delete from cities where key = '#{key}'"

puts sql_str
db.execute(sql_str)
#
print "*** 終了 ***\n"
#
# --------------------------------------------------------------------
