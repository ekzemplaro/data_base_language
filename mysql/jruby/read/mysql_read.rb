#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mysql_read.rb
#					Jul/15/2014
#
# --------------------------------------------------------
include Java
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
str_connect = "jdbc:mysql://host_mysql/city"
conn = DriverManager.getConnection(str_connect,"scott", "tiger")

sql_read_proc(conn)

conn.close()
puts "*** 終了 ***"
# --------------------------------------------------------
