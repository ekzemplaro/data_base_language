#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	excel_delete.rb
#					Aug/08/2013
#
# --------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/excel_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
excel_file=ARGV[0]
key = ARGV[1]
#
dict_aa = excel_read_proc(excel_file)

if (dict_aa.key?(key))
	dict_aa = dict_delete_proc(dict_aa,key)
	dict_display_proc(dict_aa)
	excel_write_proc(excel_file,dict_aa)
end

puts "*** 終了 ***"
# --------------------------------------------------------
