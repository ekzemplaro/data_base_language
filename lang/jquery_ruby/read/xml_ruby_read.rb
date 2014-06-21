#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	xml_read_ruby.rb
#
#					May/16/2011
#
# -------------------------------------------------------------------
require 'json'
require "rexml/document"
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
#
include REXML
# -------------------------------------------------------------------
file_in = "/var/tmp/xml_file/cities.xml"
#
xml_str = read_string_proc(file_in)
#
dict_aa=xml_to_dict_proc(xml_str)
json_str = JSON.pretty_generate(dict_aa)
#
puts "Content-type: text/json\n\n"
puts json_str
#
# -------------------------------------------------------------------
