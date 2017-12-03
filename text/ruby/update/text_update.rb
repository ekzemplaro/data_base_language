#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	ruby/update/text_update.rb
#
#				Nov/27/2017
#
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

# -------------------------------------------------------------
STDERR.puts "*** 開始 ***"
#
file_in = ARGV[0]
#
id_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts id_in,population_in
#
dict_aa = text_read_proc(file_in)
#
dict_aa = dict_update_proc(dict_aa,id_in,population_in)
text_write_proc(file_in,dict_aa)
#
STDERR.puts "*** 終了 ***"
#
# -------------------------------------------------------------
