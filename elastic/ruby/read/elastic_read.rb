#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	elastic_read.rb
#
#					Oct/07/2018
#
# ---------------------------------------------------------------------
require 'faraday'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
STDERR.puts	"*** 開始 ***"
#
URL="http://localhost:9200/cities/tochigi/_search?q=*&size=100"
#
res = Faraday.get URL

json_str = res.body

dict_data=JSON.parse(json_str)
#
list_aa = dict_data['hits']['hits']
#
dict_aa = {}
list_aa.each {|unit|
	key = unit['_id']
	ss = unit['_source']
	dict_aa[key] = ss
	}
#
dict_display_proc(dict_aa)
#
STDERR.puts	"*** 終了 ***"
# ---------------------------------------------------------------------
