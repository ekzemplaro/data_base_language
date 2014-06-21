#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	sqlite3_update.rb
#
#				Jul/30/2011
#
include Java
import org.sqlite.JDBC
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
file_sqlite3=ARGV[0]
#
#db = SQLite3::Database.new(file_sqlite3)
#
id_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts id_in,population_in
#
str_connect = "jdbc:sqlite:" + file_sqlite3
#
conn = DriverManager.getConnection(str_connect,"", "")

sql_update_proc(conn,id_in,population_in)
sql_read_proc(conn)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
