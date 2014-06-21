#! /usr/bin/ruby1.8
# -*- coding: utf-8 -*-
#
#	postgre_delete.rb
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
#
puts id_in
#
sss = Sql_manipulate.new
#
sss.delete_proc(dbi,id_in)
#
sss.disp_proc(dbi)
#
dbi.disconnect
#
puts "*** 終了 ***"
# ------------------------------------------------------------
