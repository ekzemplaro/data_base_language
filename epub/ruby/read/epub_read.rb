#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	epub_read.rb
#
#					Sep/17/2014
#
# ---------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/epub_manipulate.rb'
# ---------------------------------------------------------------------
file_epub = ARGV[0]
puts "*** 開始 ***"
#
dict_aa = epub_to_dict_proc(file_epub)
dict_display_proc(dict_aa)
#
puts "*** 終了 ***"
# ---------------------------------------------------------------------
