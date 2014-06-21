#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	sqlite3_update.rb
#
#				May/10/2013
#
require 'sqlite3'
require 'date'
#
load '/var/www/data_base/common/ruby_common/sql_manipulate.rb'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
file_sqlite3 = ARGV[0]
#
db = SQLite3::Database.new(file_sqlite3)
#
id_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts id_in,population_in
#
sss=Sql_manipulate.new
#
sss.update_proc(db,id_in,population_in)
#
sss.disp_proc(db)
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
