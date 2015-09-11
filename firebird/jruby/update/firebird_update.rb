#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	firebird_update.rb
#
#				Aug/25/2015
#
# ------------------------------------------------------------
include Java
import org.firebirdsql.jdbc.FBDriver
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
user = "sysdba"
passwd = "tiger"
database = "/var/tmp/firebird/cities.fdb"

str_connect = "jdbc:firebirdsql:host_firebird:" + database

conn = DriverManager.getConnection(str_connect,user,passwd)
#

sql_update_proc(conn,id_in,population_in)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
