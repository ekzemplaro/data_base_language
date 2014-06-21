#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	epub_ruby_read.rb
#
#					Jul/27/2012
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/epub_manipulate.rb'

require 'json'
# -------------------------------------------------------------
file_epub = "/var/tmp/epub/cities.epub"
#
puts "Content-type: text/json\n\n"
#
dict_aa = epub_to_dict_proc(file_epub)
#
json_out = JSON.pretty_generate(dict_aa)
#
puts	json_out
#
# -------------------------------------------------------------
