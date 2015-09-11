#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	couch_update.rb
#
#					Sep/03/2015
#
require 'rubygems'
require 'json'
require 'date'
#
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
server = Couch::Server.new("localhost","5984")
#
target = "/nagano/" + key_in
begin
	res = server.get(target)
	str_json = res.body
	unit_aa=JSON.parse(str_json)
	puts unit_aa["name"]
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = Date.today
	json_new=JSON.generate(unit_aa)
	puts json_new
	target_new = target + "?rev=" + unit_aa["_rev"]
	puts target_new
	server.put(target_new,json_new)
rescue
	puts "*** error ***"
end
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
