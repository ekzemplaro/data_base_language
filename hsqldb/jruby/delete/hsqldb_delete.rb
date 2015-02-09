#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	hsqldb_delete.rb
#
#				Jan/29/2015
# ------------------------------------------------------------
#
include Java
import java.sql.DriverManager
import java.lang.System
#
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
str_connect = "jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true"
#
conn = DriverManager.getConnection(str_connect,"SA", "")

sql_delete_proc(conn,id_in)
sql_read_proc(conn)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
