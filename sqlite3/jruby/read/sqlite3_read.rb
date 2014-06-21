#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	sqlite3_read.rb
#					Jul/30/2011
#
# --------------------------------------------------------
include Java
import org.sqlite.JDBC
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
file_sqlite3=ARGV[0]
#
str_connect = "jdbc:sqlite:" + file_sqlite3

conn = DriverManager.getConnection(str_connect,"", "")

sql_read_proc(conn)

conn.close()

puts "*** 終了 ***"
# --------------------------------------------------------
