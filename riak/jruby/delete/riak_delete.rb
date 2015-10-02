#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	riak_delete.rb
#
#					Oct/02/2015
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
server = Couch::Server.new("host_ubuntu","8098")
res = server.get("/riak/shimane/?keys=true")
#
data_aa=JSON.parse(res.body)
#
if (data_aa["keys"].include?(key_in))
	res = server.delete("/riak/shimane/" + key_in)
end
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
