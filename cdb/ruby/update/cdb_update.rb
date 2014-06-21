#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	cdb_update.rb
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
key_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts key_in,population_in

dict_aa = cdb_read_proc(file_cdb)

dict_aa = dict_update_proc(dict_aa,key_in,population_in)
dict_display_proc(dict_aa)
#
cdb_write_proc(file_cdb,dict_aa)
puts "*** 終了 ***"
# ------------------------------------------------------------
