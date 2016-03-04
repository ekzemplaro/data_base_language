#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_update.rb
#
#				Feb/15/2016
#
require 'rdbi'
require 'rdbi-driver-postgresql'
#
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dbh = RDBI.connect(:PostgreSQL, :dbname=>"city", :port=>5432,
	:user=>"scott", :password=>"tiger")
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
sss = Sql_manipulate.new
#
sss.update_proc(dbh,id_in,population_in)
#
dbh.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------
