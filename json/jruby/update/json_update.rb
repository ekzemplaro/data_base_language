#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	ruby/update/json_update.rb
#
#					Jan/18/2012
#
require 'rubygems'
require 'json'
require 'date'
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
json_file = ARGV[0]
id_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts id_in,population_in
#
json_str = read_string_proc(json_file)
#
dict_aa=JSON.parse(json_str)
#
dict_bb=dict_update_proc(dict_aa,id_in,population_in)
#
dict_display_proc(dict_bb)
#
json_str_out=JSON(dict_bb)
#
file_write_proc(json_file,json_str_out)
#
puts	"*** 終了 ***"
#
