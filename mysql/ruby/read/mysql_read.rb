#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mysql_read.rb
#
#					May/10/2013
#
# ------------------------------------------------------------------
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# ------------------------------------------------------------------
puts "*** 開始 ***"
#
dbi=DBI.connect("dbi:Mysql:city:host_mysql","scott","tiger")
#
mysql_utf8_proc(dbi)
#
sss=Sql_manipulate.new
#
sss.disp_proc(dbi)
dbi.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------------
