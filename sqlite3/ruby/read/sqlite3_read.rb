#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	sqlite3_read.rb
#
#					May/10/2013
#
# -------------------------------------------------------------------
require 'sqlite3'

puts	"*** 開始 *** sqlite3 ***"
#
file_sqlite3 = ARGV[0]
db = SQLite3::Database.new(file_sqlite3)
#
db.execute('select ID, Name, Population, Date_Mod from cities') do |row|
#
puts row.join("\t")
end

db.close

puts	"*** 終了 ***"
#
# -------------------------------------------------------------------
