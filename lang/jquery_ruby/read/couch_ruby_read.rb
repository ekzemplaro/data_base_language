#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	read/couch_read_ruby.rb
#
#					Jun/20/2014
#
# -------------------------------------------------------------
#
require	'restclient'
require	'json'
#
url_collection = 'http://localhost:5984/nagano'
url_docs  =  url_collection + '/_all_docs'

str_json = RestClient.get url_docs
#
list_aa=JSON.parse(str_json)
#
dict_aa={}
list_aa['rows'].each {|row|
	key = row['key']
	url_target  =  url_collection + '/' + key
	str_json = RestClient.get url_target
	unit_aa=JSON.parse(str_json)
	dict_aa[key]=unit_aa
	}
#
str_json = JSON.generate(dict_aa)
#
puts "Content-type: text/json\n\n"
puts str_json
#
#
# -------------------------------------------------------------
