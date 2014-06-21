#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	pdf_ruby_read.rb
#
#					Jun/28/2012
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/pdf_manipulate.rb'

require 'json'
# -------------------------------------------------------------
file_pdf = "/var/tmp/pdf/cities.pdf"
#
puts "Content-type: text/json\n\n"
#
dict_aa = pdf_to_dict_proc(file_pdf)
#
json_out = JSON.pretty_generate(dict_aa)
#
puts	json_out
#
# -------------------------------------------------------------
