#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	oracle_read.rb
#					Aug/06/2015
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

host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe"

conn = DriverManager.getConnection(str_connect,user,password)

sql_read_proc(conn)

conn.close()

puts "*** 終了 ***"
# --------------------------------------------------------
