#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	maria_read.rb
#
#					Sep/16/2013
#
# ------------------------------------------------------------------
require 'rdbi'
# require 'rdbi-driver-mysql'
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# ------------------------------------------------------------------
puts "*** 開始 ***"
#
#dbi=DBI.connect("dbi:Mysql:city:localhost","scott","tiger")
dbh = RDBI.connect(:Mysql, :dbname=>"city",
	:user=>"scott", :password=>"tiger")
#
mysql_utf8_proc(dbh)
#
sss=Sql_manipulate.new
#
sss.disp_proc(dbh)
dbh.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------------
