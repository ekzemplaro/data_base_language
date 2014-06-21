#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	read/mssql_read.rb
#					Jan/17/2013
#
# --------------------------------------------------------
include Java
import com.microsoft.sqlserver.jdbc.SQLServerDriver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
str_connect = "jdbc:sqlserver://host_mssql;databaseName=city;"

conn = DriverManager.getConnection(str_connect,"sa", "scott_tiger")

sql_read_proc(conn)

conn.close()

puts "*** 終了 ***"
# --------------------------------------------------------
