#! /usr/bin/ruby1.8
# -*- coding: utf-8 -*-
#
#	firebird_update.rb
#
#					May/30/2011
#
# ------------------------------------------------------------------
require 'rubygems'
gem 'fb'
#
require 'fb'
include Fb
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
# ------------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
db = Database.new(
	:database => "localhost:/var/tmp/firebird/cities.fdb",
	:username => 'SYSDBA',
	:password => 'tiger',
	:charset => 'UTF-8',
	:role => '',
	:page_size => 8192
	)
#
conn = db.connect rescue db.create.connect
#
sss=Sql_manipulate.new
#
sss.update_proc(conn,id_in,population_in)
#
sss.disp_proc(conn)
#
conn.close
puts "*** 終了 ***"
# ------------------------------------------------------------------
