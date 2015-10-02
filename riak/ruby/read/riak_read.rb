#! /usr/bin/ruby
# -*- coding: utf-8 -*-
# ------------------------------------------------------------------
#	riak_read.rb
#
#					Sep/22/2015
#
# ------------------------------------------------------------------
require 'restclient'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ------------------------------------------------------------------
puts	"*** 開始 ***\n"

url_base = 'http://host_ubuntu:8098/riak/shimane'
url_in = url_base + '?keys=true'

json_string = RestClient.get url_in
data_aa=JSON.parse(json_string)


count = data_aa['keys'].length
puts count

dict_aa={}
data_aa['keys'].each {|key|
	url_city = url_base + '/' + key
	json_city = RestClient.get url_city
	unit_aa=JSON.parse(json_city)
	if (unit_aa != nil)
		then
		dict_aa[key]=unit_aa	
	end
	}
#
dict_display_proc (dict_aa)
puts	"*** 終了 ***\n"
# ------------------------------------------------------------------
