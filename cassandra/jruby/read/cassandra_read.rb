#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	cassandra_read.rb
#
#					Sep/06/2013
#
# ---------------------------------------------------------------------
include	Java
import	java.util.HashMap

import	java.sql.Connection
import	java.sql.DriverManager


load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/cassandra_manipulate.rb'
# ---------------------------------------------------------------------
puts "*** 開始 ***"

str_connect = "jdbc:cassandra://localhost:9160/city"
conn = DriverManager.getConnection (str_connect)

dict_aa = cassandra_to_dict_proc(conn)

conn.close()

dict_display_proc(dict_aa)

puts "*** 終了 ***"

# ---------------------------------------------------------------------
