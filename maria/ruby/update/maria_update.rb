#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	maria_update.rb
#
#				Sep/16/2013
#
require 'dbi'
require 'date'
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mysql_utf8.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
dbi=DBI.connect("dbi:Mysql:city:localhost","scott","tiger")
#
mysql_utf8_proc(dbi)
#
sss=Sql_manipulate.new
#
sss.update_proc(dbi,id_in,population_in)
#
sss.disp_proc(dbi)
#
dbi.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------
