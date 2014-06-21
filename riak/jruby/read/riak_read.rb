#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	riak_read.rb
#
#					Mar/18/2013
#
require 'rubygems'
require 'open-uri'
require 'json'
#
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
#
url_base = 'http://localhost:8098/riak/shimane'
url_in = url_base + '?keys=true'

response= open(url_in,:proxy=>nil)
str_json=response.read
data_aa=JSON.parse(str_json)
#
data_aa['keys'].each {|key|
	url_city = url_base + '/' + key
	response= open(url_city,:proxy=>nil)
	str_city=response.read
	city=JSON.parse(str_city)
	print key,"\t"
	print city["name"],"\t"
	print city["population"],"\t"
	print city["date_mod"],"\n"
	}
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
