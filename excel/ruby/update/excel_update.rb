#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	excel_update.rb
#
#					Jul/15/2013
#
# -------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/excel_manipulate.rb'

# -------------------------------------------------------------------
require 'spreadsheet'

puts	"*** 開始 ***"

file_excel = ARGV[0]
id_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts id_in,population_in


dict_aa = excel_read_proc(file_excel)
dict_aa = dict_update_proc(dict_aa,id_in,population_in)

excel_write_proc(file_excel,dict_aa)



dict_display_proc(dict_aa)

puts	"*** 終了 ***"
#
