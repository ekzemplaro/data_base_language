#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	riak_delete.rb
#
#					Sep/22/2015
#
require 'json'
require 'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
#
puts key_in
#
url_base = 'http://host_ubuntu:8098/riak/shimane'
url_in = url_base + '?keys=true'
json_string = RestClient.get url_in
data_aa=JSON.parse(json_string)
count = data_aa['keys'].length
#
if (data_aa['keys'].include?(key_in))
	url_target = url_base + '/' + key_in
	RestClient.delete url_target
end
#
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
