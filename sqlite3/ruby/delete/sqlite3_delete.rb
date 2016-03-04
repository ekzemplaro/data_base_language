#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	sqlite3_delete.rb
#
#					Feb/15/2016
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
key_in = ARGV[1]
#
puts key_in
#
sss=Sql_manipulate.new
#
sss.delete_proc(db,key_in)
#
puts "*** 終了 ***"
#
# ------------------------------------------------------------
