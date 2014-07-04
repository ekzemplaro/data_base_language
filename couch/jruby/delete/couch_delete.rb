#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	couch_delete.rb
#
#					Jun/24/2014
#
require 'rubygems'
require 'json'
#
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
#
puts key_in
#
server = Couch::Server.new("localhost","5984")
#
target = "/nagano/" + key_in
begin
	res = server.get(target)
	str_json = res.body
	puts str_json
	unit_aa=JSON.parse(str_json)
	puts unit_aa["name"]
	server.delete("/nagano/" + key_in + "?rev=" + unit_aa["_rev"])
rescue
	puts "*** not exist ***"
end
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
