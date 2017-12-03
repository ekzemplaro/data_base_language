#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	read/text_read.rb
#
#					Nov/27/2017
#
# ---------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

# ---------------------------------------------------------------------
file_in = ARGV[0]
#
STDERR.puts "*** 開始 ***"
#
dict_aa = text_read_proc(file_in)
dict_display_proc(dict_aa)
#
STDERR.puts "*** 終了 ***"
# ---------------------------------------------------------------------
