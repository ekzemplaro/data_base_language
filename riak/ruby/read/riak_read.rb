#! /usr/bin/ruby
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------
#	riak_read.rb
#
#					Mar/11/2013
#
# ------------------------------------------------------------------
require 'restclient'
#
require 'json'
#
# ------------------------------------------------------------------
puts	"*** 開始 ***\n"

url_base = 'http://localhost:8098/riak/shimane'
url_in = url_base + '?keys=true'

json_string = RestClient.get url_in
data_aa=JSON.parse(json_string)


count = data_aa['keys'].length
puts count

data_aa['keys'].each {|key|
	url_city = url_base + '/' + key
	json_city = RestClient.get url_city
	city=JSON.parse(json_city)
	if (city != nil)
		then
		print key,"\t"
		print city["name"],"\t"
		print city["population"],"\t"
		print city["date_mod"],"\n"
	end
	}

puts	"*** 終了 ***\n"
# ------------------------------------------------------------------
