#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_delete.rb
#
#				Feb/03/2017
#
require 'rdbi'
require 'rdbi-driver-postgresql'
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
user = "scott"
password = "tiger"
data_base = 'city'
dbh = RDBI.connect(:PostgreSQL, :dbname=>data_base, :port=>5432,
	:user=>user, :password=>password)
#
id_in = ARGV[0]
#
puts id_in
#
sss = Sql_manipulate.new
#
sss.delete_proc(dbh,id_in)
#
dbh.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------
