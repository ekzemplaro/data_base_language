#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	xlsx_read.rb
#					Aug/07/2013
#
# --------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/xlsx_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
xlsx_file=ARGV[0]
#
dict_aa = xlsx_read_proc(xlsx_file)

dict_display_proc(dict_aa)

puts "*** 終了 ***"
# --------------------------------------------------------
