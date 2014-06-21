#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	webdav_delete.rb
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
key_in = ARGV[0]
#
puts key_in
#
res = server.get("/city/tokyo.json")
#
str_json = res.body
#
dict_aa=JSON.parse(str_json)
#
if (dict_aa.key?(key_in))
	dict_aa=dict_delete_proc(dict_aa,key_in)
	dict_display_proc(dict_aa)
	json_str_out = JSON(dict_aa)
	server.put("/city/tokyo.json",json_str_out)
end
#
puts	"*** 終了 ***"
#
