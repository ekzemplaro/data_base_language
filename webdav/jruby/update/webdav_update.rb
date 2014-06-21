#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	webdav_update.rb
#
#					Jan/23/2012
#
require 'rubygems'
require 'json'
require 'net/http'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
server = Couch::Server.new("host_dbase", "3004")
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
res = server.get("/city/tokyo.json")
#
str_json = res.body
#
#puts str_json
#
dict_aa=JSON.parse(str_json)
#
dict_aa=dict_update_proc(dict_aa,id_in,population_in)

dict_display_proc(dict_aa)
#
json_str_out = JSON(dict_aa)
#
server.put("/city/tokyo.json",json_str_out)
#
puts	"*** 終了 ***"
#
