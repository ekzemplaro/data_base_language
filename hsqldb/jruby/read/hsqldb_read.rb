#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	read/hsqldb_read.rb
#					Jan/29/2015
#
# --------------------------------------------------------
include Java
#
import java.sql.DriverManager
import java.lang.System
import java.lang.Class
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
#

str_connect = "jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true"

conn = DriverManager.getConnection(str_connect,"SA", "")

sql_read_proc(conn)

conn.close()

puts "*** 終了 ***"
# --------------------------------------------------------
