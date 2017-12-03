#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	delete/text_delete.rb
#
#				Nov/27/2017
#
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# -------------------------------------------------------------
STDERR.puts "*** 開始 ***"
#
file_in = ARGV[0]
#
id_in = ARGV[1]
#
puts id_in
#
dict_aa = text_read_proc(file_in)
#
dict_aa = dict_delete_proc(dict_aa,id_in)
text_write_proc(file_in,dict_aa)
#
STDERR.puts "*** 終了 ***"
#
# -------------------------------------------------------------
