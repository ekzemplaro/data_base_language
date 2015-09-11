#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	oracle_delete.rb
#
#				Aug/06/2015
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
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe"

conn = DriverManager.getConnection(str_connect,user,password)
#
sql_delete_proc(conn,id_in)
#
conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
