#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/update/json_update.rb
#
#					Nov/27/2017
#
require 'json'
require 'date'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
# ---------------------------------------------------------------------
STDERR.puts	"*** 開始 ***"
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
dict_bb = dict_update_proc(dict_aa,id_in,population_in)
#
json_out = JSON.pretty_generate(dict_aa)
file_write_proc(json_file,json_out)
#
STDERR.puts	"*** 終了 ***"
#
