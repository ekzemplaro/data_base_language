#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	derby_delete.rb
#
#				Oct/01/2012
#
include Java
import org.apache.derby.jdbc.ClientDriver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
#
id_in = ARGV[0]
#
puts id_in
#
str_connect = "jdbc:derby://localhost:1527/city_aaa;create=true"
#
conn = DriverManager.getConnection(str_connect)

sql_delete_proc(conn,id_in)
sql_read_proc(conn)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
