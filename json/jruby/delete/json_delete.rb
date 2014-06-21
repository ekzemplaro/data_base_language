#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	ruby/delete/json_delete.rb
#
#					Jan/26/2012
#
require 'rubygems'
require 'json'
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
json_file = ARGV[0]
key_in = ARGV[1]
#
puts key_in
#
json_str = read_string_proc(json_file)
#
dict_aa=JSON.parse(json_str)
#
if (dict_aa.key?(key_in))
	dict_aa=dict_delete_proc(dict_aa,key_in)
	dict_display_proc(dict_aa)
	json_str=JSON(dict_aa)
	file_write_proc(json_file,json_str)
end
#
puts	"*** 終了 ***"
#
