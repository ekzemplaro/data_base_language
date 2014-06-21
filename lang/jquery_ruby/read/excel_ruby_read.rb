#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	excel_ruby_read.rb
#
#					Jul/31/2011
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/excel_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

require 'json'
require 'spreadsheet'
# -------------------------------------------------------------
file_excel = "/var/tmp/excel/cities.xls"
#
puts "Content-type: text/json\n\n"
#
dict_aa = excel_read_proc(file_excel)
#
json_out = JSON.pretty_generate(dict_aa)
#
puts	json_out
#
# -------------------------------------------------------------
