#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	update/text_update.rb
#
#				Aug/03/2013
#
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

# -------------------------------------------------------------
puts "*** 開始 ***"
#
file_in = ARGV[0]
#
key = ARGV[1]
population_in = ARGV[2].to_i
#
puts key,population_in
#
dict_aa = text_read_proc(file_in)
#
if (dict_aa.key?(key))
	dict_aa = dict_update_proc(dict_aa,key,population_in)
	dict_display_proc(dict_aa)
	text_write_proc(file_in,dict_aa)
end
#
puts "*** 終了 ***"
#
# -------------------------------------------------------------
