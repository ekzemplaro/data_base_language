#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	json_read.rb
#
#					Apr/25/2011
#
# ---------------------------------------------------------------------
require 'json'
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
json_file = ARGV[0]
puts	"*** 開始 ***"
#
json_str = read_string_proc(json_file)
#
dict_aa=JSON.parse(json_str)
#
dict_display_proc(dict_aa)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
