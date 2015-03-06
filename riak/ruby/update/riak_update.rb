#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	riak_update.rb
#
#					Feb/24/2015
#
require 'json'
require 'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
url_base = 'http://host_ubuntu1:8098/riak/shimane'
url_in = url_base + '?keys=true'
json_string = RestClient.get url_in
data_aa=JSON.parse(json_string)
count = data_aa['keys'].length
#
if (data_aa['keys'].include?(key_in))
	url_target = url_base + '/' + key_in
	json_city = RestClient.get url_target
	city = JSON.parse(json_city)
	city['population'] = population_in
	city['date_mod'] = Date.today
	json_out = JSON.generate(city)
	puts json_out
	RestClient.put url_target, json_out
end
#
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
