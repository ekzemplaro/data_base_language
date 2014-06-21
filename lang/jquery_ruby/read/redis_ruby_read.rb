#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	redis_ruby_read.rb
#
#					Jun/13/2013
# -------------------------------------------------------------
require 'rubygems'
require 'redis'
require 'json'
#
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# -------------------------------------------------------------
puts "Content-type: text/json\n\n"
#
#redis = Redis.new(:host => "host_dbase", :port => 6379)
redis = Redis.new(:host => "cddn007", :port => 6379)
#
dict_aa = redis_to_dict_proc(redis)
#
json_str = JSON.pretty_generate(dict_aa)
#
puts json_str
#
#
# -------------------------------------------------------------
