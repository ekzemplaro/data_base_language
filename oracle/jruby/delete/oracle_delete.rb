#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	oracle_delete.rb
#
#				Jun/09/2011
#
include Java
import java.sql.DriverManager
import java.lang.System
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
Java::JavaClass.for_name("oracle.jdbc.driver.OracleDriver")
str_connect = "jdbc:oracl:thin:@spn109:1521/xe"
conn = DriverManager.getConnection(str_connect,"scott", "tiger")
#
sql_delete_proc(conn,id_in)
sql_read_proc(conn)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
