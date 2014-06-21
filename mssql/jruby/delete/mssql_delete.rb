#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mssql_delete.rb
#
#				Jan/17/2013
#
include Java
import com.microsoft.sqlserver.jdbc.SQLServerDriver
import java.sql.DriverManager
import java.lang.System
#
require 'date'
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
#
puts id_in
#
str_connect = "jdbc:sqlserver://host_mssql;databaseName=city;"
#
conn = DriverManager.getConnection(str_connect,"sa","scott_tiger")

sql_delete_proc(conn,id_in)
sql_read_proc(conn)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
