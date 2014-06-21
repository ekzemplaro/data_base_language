#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	delete/text_delete.rb
#
#				Aug/07/2013
#
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# -------------------------------------------------------------
puts "*** 開始 ***"
#
file_in = ARGV[0]
#
key = ARGV[1]
#
puts key
#
dict_aa = text_read_proc(file_in)
#
if (dict_aa.key?(key))
	dict_aa = dict_delete_proc(dict_aa,key)
	dict_display_proc(dict_aa)
	text_write_proc(file_in,dict_aa)
end
#
puts "*** 終了 ***"
#
# -------------------------------------------------------------
