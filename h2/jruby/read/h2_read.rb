#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	h2_read.rb
#					Jun/09/2011
#
# --------------------------------------------------------
include Java
import org.h2.Driver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
str_connect = "jdbc:h2:file:/var/tmp/h2/cities"
conn = DriverManager.getConnection(str_connect,"SA", "")

sql_read_proc(conn)

conn.close()
puts "*** 終了 ***"
# --------------------------------------------------------
