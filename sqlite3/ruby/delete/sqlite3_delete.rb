#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	sqlite3_delete.rb
#
#					May/10/2013
#
require 'sqlite3'
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
#
puts id_in
#
sss=Sql_manipulate.new
#
sss.delete_proc(db,id_in)
#
sss.disp_proc(db)
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
