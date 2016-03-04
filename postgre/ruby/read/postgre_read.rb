#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_read.rb
#
#						Feb/15/2016
#
require 'rdbi'
require 'rdbi-driver-postgresql'
#
# --------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# --------------------------------------------------------------------
puts "*** 開始 ***"
#
dbh = RDBI.connect(:PostgreSQL, :dbname=>"city", :port=>5432,
	:user=>"scott", :password=>"tiger")
#
sss = Sql_manipulate.new
sss.disp_proc(dbh)
#
dbh.disconnect
#
puts "*** 終了 ***"
# --------------------------------------------------------------------
