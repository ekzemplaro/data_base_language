#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	couch_update.rb
#
#					Jun/20/2014
#
require 'restclient'
require 'json'
require 'date'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
url_collection = 'http://localhost:5984/nagano'
url_target = url_collection + '/' + key_in
json_str = RestClient.get url_target
unit_aa=JSON.parse(json_str)
#
puts unit_aa['name']
unit_aa['population'] = population_in
unit_aa['date_mod'] = Date.today
json_new=JSON.generate(unit_aa)
puts json_new
#
RestClient.put url_target, json_new
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
