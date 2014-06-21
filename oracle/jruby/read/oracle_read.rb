#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	oracle_read.rb
#					Jun/09/2011
#
# --------------------------------------------------------
include Java
#import oracle.jdbc.driver.OracleDriver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"

#Class.forName("oracle.jdbc.driver.OracleDriver")
Java::JavaClass.for_name("oracle.jdbc.driver.OracleDriver")

str_connect = "jdbc:oracl:thin:@spn109:1521/xe"

conn = DriverManager.getConnection(str_connect,"scott", "tiger")

sql_read_proc(conn)

conn.close()
puts "*** 終了 ***"
# --------------------------------------------------------
