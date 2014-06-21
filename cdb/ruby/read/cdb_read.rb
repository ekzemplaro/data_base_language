#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	cdb_read.rb
#
#						Mar/26/013
#
# ------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cdb_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
file_cdb = ARGV[0]

dict_aa = cdb_read_proc(file_cdb)

dict_display_proc(dict_aa)
#
puts "*** 終了 ***"
# ------------------------------------------------------------
