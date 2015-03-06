#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	couch_read.rb
#
#					Feb/24/2015
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
dict_display_proc (dict_aa)
puts	"*** 終了 ***"
#
