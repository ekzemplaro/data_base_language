#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_delete.rb
#
#				Feb/15/2016
#
require 'rdbi'
require 'rdbi-driver-postgresql'
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dbh = RDBI.connect(:PostgreSQL, :dbname=>"city", :port=>5432,
	:user=>"scott", :password=>"tiger")
#
#
id_in = ARGV[0]
#
puts id_in
#
sss = Sql_manipulate.new
#
sss.delete_proc(dbh,id_in)
#
#
dbh.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------
