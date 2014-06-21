#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	read/text_read.rb
#
#					Jan/21/2011
#
# ---------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

# ---------------------------------------------------------------------
file_in = ARGV[0]
#
puts "*** 開始 ***"
#
dict_aa = text_read_proc(file_in)
dict_display_proc(dict_aa)
#
puts "*** 終了 ***"
# ---------------------------------------------------------------------
