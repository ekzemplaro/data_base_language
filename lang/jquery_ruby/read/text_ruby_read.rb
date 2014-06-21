#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	text_ruby_read.rb
#
#					May/13/2013
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

require 'json'
# -------------------------------------------------------------
file_in = "/var/tmp/plain_text/cities.txt"
#
puts "Content-type: text/json\n\n"
#
dict_aa = text_read_proc(file_in)
#
json_out = JSON.generate(dict_aa)
#
puts	json_out
#
# -------------------------------------------------------------
