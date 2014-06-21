#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	firebird_read.rb
#					May/21/2012
#
# --------------------------------------------------------
include Java
import org.firebirdsql.jdbc.FBDriver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
str_connect = "jdbc:firebirdsql:localhost/3050:/var/tmp/firebird/cities.fdb"

conn = DriverManager.getConnection(str_connect,"sysdba", "tiger")

sql_read_proc(conn)

conn.close()

puts "*** 終了 ***"
# --------------------------------------------------------
