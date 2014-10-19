#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_update.rb
#
#				Sep/14/2011
#
require 'dbi'
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dbi=DBI.connect("dbi:Pg:city:localhost","scott","tiger")
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
sss = Sql_manipulate.new
#
sss.update_proc(dbi,id_in,population_in)
#
sss.disp_proc(dbi)
#
dbi.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------
