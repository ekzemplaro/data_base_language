#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_read.rb
#
#						Sep/14/2018
#
require 'rdbi'
require 'rdbi-driver-postgresql'
#
# --------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# --------------------------------------------------------------------
puts "*** 開始 ***"
#
user = "scott"
password = "tiger123"
data_base = 'city'
dbh = RDBI.connect(:PostgreSQL, :dbname=>data_base, :port=>5432,
	:user=>user, :password=>password)
#
sss = Sql_manipulate.new
sss.disp_proc(dbh)
#
dbh.disconnect
#
puts "*** 終了 ***"
# --------------------------------------------------------------------
