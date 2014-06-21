#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	neo4j_read.rb
#
#					Jan/31/2012
#
require 'rubygems'
require 'open-uri'
#
require 'json'
#
# ---------------------------------------------------------------------
def	row_parser (key)
	url_in = 'http://localhost:7474/db/data/node/' + key.to_s + '/properties'
	response= open(url_in,:proxy=>nil)
	str_json=response.read
#
	hhh=JSON.parse(str_json)
#
	print hhh["id"],"\t",hhh["name"],"\t",hhh["population"], \
		"\t",hhh["date_mod"]
#
	puts 
end

#
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
for key in 2..10
	row_parser(key)
end
#json_display_proc(str_json)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
