#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	read/xml_read.rb
#
#					May/18/2011
#
# -------------------------------------------------------------
include	Java
import	java.lang.System
#
require "rexml/document"
include REXML
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
# -------------------------------------------------------------
#
System.out.println("*** 開始 ***")
#
xml_file = ARGV[0]
#
xml_str = read_string_proc(xml_file)

dict_aa=xml_to_dict_proc(xml_str)
dict_display_proc(dict_aa)
#
System.out.println("*** 終了 ***")
#
# -------------------------------------------------------------
