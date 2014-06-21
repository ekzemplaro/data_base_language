#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	excel_read.rb
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

dict_aa = excel_read_proc(file_excel)
dict_display_proc(dict_aa)

puts	"*** 終了 ***"
#
