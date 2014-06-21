#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	postgre_delete.rb
#
#					Jul/30/2011
#
include Java
import org.postgresql.Driver
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
str_connect = "jdbc:postgresql://localhost/city"
#
conn = DriverManager.getConnection(str_connect,"scott", "tiger")

sql_delete_proc(conn,id_in)
sql_read_proc(conn)

conn.close()
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
