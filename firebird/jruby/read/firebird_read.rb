#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	firebird_read.rb
#					Aug/25/2015
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
#
user = "sysdba"
passwd = "tiger"
database = "/var/tmp/firebird/cities.fdb"

str_connect = "jdbc:firebirdsql:host_firebird:" + database

conn = DriverManager.getConnection(str_connect,user,passwd)

sql_read_proc(conn)

conn.close()

puts "*** 終了 ***"
# --------------------------------------------------------
