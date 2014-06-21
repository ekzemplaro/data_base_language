#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	cassandra_delete.rb
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
#
puts key

str_connect = "jdbc:cassandra://localhost:9160/city"
conn = DriverManager.getConnection (str_connect)

cassandra_delete_proc(conn,key)

conn.close()

puts "*** 終了 ***"

# ---------------------------------------------------------------------
