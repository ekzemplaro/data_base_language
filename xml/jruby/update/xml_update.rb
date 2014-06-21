#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	update/xml_update.rb
#
#					May/18/2011
#
# ------------------------------------------------------------
include	Java
import	java.lang.System
#
require "rexml/document"
include REXML
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ------------------------------------------------------------
puts	"*** 開始 *** xml_update.rb ***"
System.out.println("*** 開始 ***")
#
xml_file = ARGV[0]
#
id_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts id_in,population_in
#
xml_str = read_string_proc(xml_file)

dict_aa=xml_to_dict_proc(xml_str)
dict_update_proc(dict_aa,id_in,population_in)
#
dict_display_proc(dict_aa)
#
str_out=dict_to_xml_proc(dict_aa)
#
file_write_proc(xml_file,str_out)
#
#
puts	"*** 終了 *** xml_update.rb ***"
System.out.println("*** 終了 ***")
#
# ------------------------------------------------------------
