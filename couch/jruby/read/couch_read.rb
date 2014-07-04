#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	couch_read.rb
#
#					Jun/24/2014
#
require 'rubygems'
require 'open-uri'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
#
url_collection = 'http://localhost:5984/nagano'
url_docs  =  url_collection + '/_all_docs'
response= open(url_docs,:proxy=>nil)
str_json=response.read
#
#
list_aa=JSON.parse(str_json)
#
puts list_aa['total_rows']
#
list_aa['rows'].each {|row|
	key = row['key']
	url_target  =  url_collection + '/' + key
	response = open(url_target,:proxy=>nil)
	str_json=response.read
	unit_aa=JSON.parse(str_json)
	print(key,"\t")
	print(unit_aa['name'],"\t")
	print(unit_aa['population'],"\t")
	print(unit_aa['date_mod'],"\n")
	}

puts	"*** 終了 ***"
#
