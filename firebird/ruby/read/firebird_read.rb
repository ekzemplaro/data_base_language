#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	firebird_read.rb
#
#					May/10/2013
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
db = Database.new(
	:database => "localhost:/var/tmp/firebird/cities.fdb",
	:username => 'sysdba',
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
sss.disp_proc(conn)
#
conn.close
puts "*** 終了 ***"
# ------------------------------------------------------------------
