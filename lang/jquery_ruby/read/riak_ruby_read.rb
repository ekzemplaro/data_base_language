#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	read/riak_read_ruby.rb
#
#					Mar/13/2013
#
# -------------------------------------------------------------
#
require	'restclient'
require	'json'
#
url_base = 'http://localhost:8098/riak/shimane'
url_in = url_base + '?keys=true'
json_string = RestClient.get url_in
data_aa=JSON.parse(json_string)
#
dict_aa={}
count = data_aa['keys'].length
data_aa['keys'].each {|key|
	url_city = url_base + '/' + key
	json_city = RestClient.get url_city
	city=JSON.parse(json_city)
	if (city != nil)
		then
		dict_aa[key] = city
	end
	}
#
str_json = JSON.generate(dict_aa)
#
puts "Content-type: text/json\n\n"
puts str_json
#
#
# -------------------------------------------------------------
