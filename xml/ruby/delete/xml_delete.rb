#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	xml_delete.rb
#
#					May/16/2011
#
require "rexml/document"
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
include REXML
#
# ------------------------------------------------------------
puts	"*** 開始 ***"
#
xml_file = ARGV[0]
#
id_in = ARGV[1]
#
puts id_in
#
xml_str = read_string_proc(xml_file)

dict_aa=xml_to_dict_proc(xml_str)
dict_aa=dict_delete_proc(dict_aa,id_in)
#
dict_display_proc(dict_aa)
#
str_out=dict_to_xml_proc(dict_aa)
#
file_write_proc(xml_file,str_out)
#
puts	"*** 終了 ***"
#
# ------------------------------------------------------------
