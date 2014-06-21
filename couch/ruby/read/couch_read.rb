#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	couch_read.rb
#
#					Jun/20/2014
#
require 'restclient'
#
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
#
url_collection = 'http://localhost:5984/nagano'
url_docs  =  url_collection + '/_all_docs'
puts url_docs
str_json = RestClient.get url_docs
#
list_aa=JSON.parse(str_json)
#puts list_aa['rows']
list_aa['rows'].each {|row|
	key = row['key']
	url_target  =  url_collection + '/' + key
	str_json = RestClient.get url_target
	unit_aa=JSON.parse(str_json)
	print(key,"\t")
	print(unit_aa['name'],"\t")
	print(unit_aa['population'],"\t")
	print(unit_aa['date_mod'],"\n")
	}
#
puts	"*** 終了 ***"
#
