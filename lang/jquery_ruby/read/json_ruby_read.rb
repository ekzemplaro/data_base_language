#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	json_ruby_read.rb
#
#					Apr/27/2011
#
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
#
#
json_file = "/var/tmp/json/cities.json"
#
json_str = read_string_proc(json_file)
puts "Content-type: text/json\n\n"
puts json_str
#
#
#
