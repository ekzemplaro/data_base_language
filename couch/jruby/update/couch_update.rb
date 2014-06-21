#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	couch_update.rb
#
#					Jan/18/2012
#
require 'rubygems'
require 'json'
require 'net/http'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
server = Couch::Server.new("cddn007","5984")
#
res = server.get("/city/cities")
#
str_json = res.body
dict_aa=JSON.parse(str_json)
dict_aa=dict_update_proc(dict_aa,key_in,population_in)
#
#dict_display_proc(dict_aa)
#
json_str_out=JSON(dict_aa)
#
#puts json_str_out
#
server.put("/city/cities",json_str_out)
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
