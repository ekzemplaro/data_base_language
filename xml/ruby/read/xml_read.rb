#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#		xml_file/ruby/read/xml_read.rb
#
#					May/16/2011
#
require "rexml/document"
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
include REXML
# -------------------------------------------------------------
puts	"*** 開始 *** xml_read.rb ***"
#
xml_file = ARGV[0]
#
xml_str = read_string_proc(xml_file)

dict_aa=xml_to_dict_proc(xml_str)
dict_display_proc(dict_aa)
#
puts	"*** 終了 *** xml_read.rb ***"
#
# -------------------------------------------------------------
