#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	riak_update.rb
#
#					Oct/02/2015
#
require 'rubygems'
require 'json'
require 'net/http'
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
server = Couch::Server.new("host_ubuntu","8098")
res = server.get("/riak/shimane/?keys=true")
#
data_aa=JSON.parse(res.body)
#
if (data_aa["keys"].include?(key_in))
	target = "/riak/shimane/" + key_in
	res = server.get(target)
	city=JSON.parse(res.body)
	puts city["name"]
	city["population"] = population_in
	city["date_mod"] = Date.today
	json_str=JSON(city)
	puts json_str
	server.put(target,json_str)
end
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
