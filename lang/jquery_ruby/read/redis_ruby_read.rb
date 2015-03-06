#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	redis_ruby_read.rb
#
#					Feb/26/2015
# -------------------------------------------------------------
# require 'rubygems'
require 'redis'
require 'json'
#
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# -------------------------------------------------------------
puts "Content-type: text/json; charset=UTF-8\n\n"
#
#
dict_aa = redis_to_dict_proc("host_dbase")
#
json_str = JSON.generate(dict_aa)
#
puts json_str
#
#
# -------------------------------------------------------------
