#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	cassandra_update.rb
#
#					Sep/06/2013
#
# ---------------------------------------------------------------------
include	Java

import	java.sql.Connection
import	java.sql.DriverManager

load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/cassandra_manipulate.rb'
# ---------------------------------------------------------------------
puts "*** 開始 ***"

key = ARGV[0]
population_in = ARGV[1].to_i
#
puts key,population_in

str_connect = "jdbc:cassandra://localhost:9160/city"
conn = DriverManager.getConnection (str_connect)

cassandra_update_proc(conn,key,population_in)

conn.close()

puts "*** 終了 ***"

# ---------------------------------------------------------------------
