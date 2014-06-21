#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	postgre_read.rb
#					Jul/30/2011
#
# --------------------------------------------------------
include Java
import org.postgresql.Driver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
str_connect = "jdbc:postgresql://localhost/city"

conn = DriverManager.getConnection(str_connect,"scott", "tiger")

sql_read_proc(conn)

conn.close()
puts "*** 終了 ***"
# --------------------------------------------------------
