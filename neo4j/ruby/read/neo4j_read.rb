#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	neo4j_read.rb
#
#					Aug/30/2012
#
require 'restclient'
#
require 'json'
#
# ---------------------------------------------------------------------
def	row_parser (key)
	url_in = 'http://localhost:7474/db/data/node/' + key.to_s + '/properties'
	str_json = RestClient.get url_in
#	puts str_json
#
	hhh=JSON.parse(str_json)
#
	if (hhh.key?("id"))
		print hhh["id"],"\t",hhh["name"],"\t",hhh["population"], \
		"\t",hhh["date_mod"]
		puts
	end
end

#
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
for key in 1..9
#	puts key
	row_parser(key)
end
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
