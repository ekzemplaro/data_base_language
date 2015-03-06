#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	sqlite3_read.rb
#
#					Feb/26/2015
#
# -------------------------------------------------------------------
require 'sqlite3'

load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# -------------------------------------------------------------------
def sqlite3_to_dict_proc(file_sqlite3)
	dict_aa={}
	db = SQLite3::Database.new(file_sqlite3)
#
	db.execute('select ID,Name,Population,Date_Mod from cities') do |row|
#
		dict_aa=dict_append_proc(dict_aa,row[0],row[1],row[2],row[3])
		end

	db.close

	return	dict_aa
end
# -------------------------------------------------------------------
puts	"*** 開始 *** sqlite3 ***"
#
file_sqlite3 = ARGV[0]

dict_aa = sqlite3_to_dict_proc(file_sqlite3)

dict_display_proc(dict_aa)
puts	"*** 終了 ***"
#
# -------------------------------------------------------------------
