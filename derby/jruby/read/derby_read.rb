#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	read/derby_read.rb
#					Oct/01/2012
#
# --------------------------------------------------------
include Java
import org.apache.derby.jdbc.ClientDriver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
str_connect = "jdbc:derby://localhost:1527/city_aaa;create=true"

conn = DriverManager.getConnection(str_connect)

sql_read_proc(conn)

conn.close()

puts "*** 終了 ***"
# --------------------------------------------------------
