#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	csv_ruby_read.rb
#
#					May/13/2013
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

require 'json'
# -------------------------------------------------------------
file_in = "/var/tmp/csv/cities.csv"
#
puts "Content-type: text/json\n\n"
#
dict_aa = csv_read_proc(file_in)
#
#json_out = JSON.pretty_generate(dict_aa)
json_out = JSON.generate(dict_aa)
#
puts	json_out
#
# -------------------------------------------------------------
