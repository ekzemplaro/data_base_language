#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	couch_delete.rb
#
#					Jan/18/2012
#
require 'rubygems'
require 'json'
require 'net/http'
#
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
#
puts key_in
#
server = Couch::Server.new("cddn007","5984")
#
res = server.get("/city/cities")
#
str_json = res.body
dict_aa=JSON.parse(str_json)
#
if (dict_aa.key?(key_in))
	dict_aa.delete(key_in)
	json_str_out=JSON(dict_aa)
	server.put("/city/cities",json_str_out)
end
#
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
