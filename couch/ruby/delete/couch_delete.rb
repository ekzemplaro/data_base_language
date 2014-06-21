#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	couch_delete.rb
#
#					Jun/20/2014
#
require 'json'
require 'restclient'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
#
puts key_in
#
url_collection = 'http://localhost:5984/nagano'
url_target = url_collection + '/' + key_in
begin
	json_str = RestClient.get url_target
	unit_aa=JSON.parse(json_str)
	if (unit_aa.key?('_rev'))
		puts unit_aa['name']
		url_del =  url_target + '?rev=' + unit_aa['_rev']
		RestClient.delete url_del
	end
rescue => ex
	puts ex.message
end
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
