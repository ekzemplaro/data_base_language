#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	cdb_ruby_read.rb
#
#					Mar/26/2013
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cdb_manipulate.rb'

require 'json'
# -------------------------------------------------------------
file_cdb = "/var/tmp/cdb/cities.cdb"
#
puts "Content-type: text/json\n\n"
#
dict_aa = cdb_read_proc(file_cdb)
#
json_out = JSON.generate(dict_aa)
#
puts	json_out
#
# -------------------------------------------------------------
