#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	delete/csv_delete.rb
#
#				Jul/02/2011
#
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# -------------------------------------------------------------
puts "*** 開始 ***"
#
file_in = ARGV[0]
#
id_in = ARGV[1]
#
puts id_in
#
dict_aa = csv_read_proc(file_in)
#
dict_aa = dict_delete_proc(dict_aa,id_in)
dict_display_proc(dict_aa)
csv_write_proc(file_in,dict_aa)
#
puts "*** 終了 ***"
#
# -------------------------------------------------------------
