#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	oracle_update.rb
#
#				Aug/06/2015
#
include Java
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
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe"

conn = DriverManager.getConnection(str_connect,user,password)
#
sql_update_proc(conn,id_in,population_in)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
