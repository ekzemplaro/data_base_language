#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	db2_update.rb
#
#					Jun/09/2011
#
#
# ---------------------------------------------------------------------
include Java
import java.sql.DriverManager
import java.lang.System
#
require 'date'
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
Java::JavaClass.for_name("COM.ibm.db2.jdbc.app.DB2Driver")

url = "jdbc:db2:cities"

user = "scott"
pass = "tiger"

conn = DriverManager.getConnection(url,user,pass)

sql_update_proc(conn,id_in,population_in)

sql_read_proc(conn)

conn.close()

puts	"*** 終了 ***"

# ---------------------------------------------------------------------
