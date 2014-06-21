#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	excel_read.rb
#					Aug/08/2013
#
# --------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/excel_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
excel_file=ARGV[0]
#
dict_aa = excel_read_proc(excel_file)

dict_display_proc(dict_aa)

puts "*** 終了 ***"
# --------------------------------------------------------
