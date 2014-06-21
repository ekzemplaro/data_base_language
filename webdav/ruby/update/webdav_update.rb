#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	webdav_update.rb
#
#					Jan/23/2012
# --------------------------------------------------------------------------
#
require 'rubygems'
require 'open-uri'
require 'json'
require 'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# --------------------------------------------------------------------------
#
puts "*** 開始 ***"
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
url_target='http://cddn007:3004/city/tokyo.json'
response= open(url_target,:proxy=>nil)
json_str=response.read
#
#
dict_aa=JSON.parse(json_str)
#
dict_bb = dict_update_proc(dict_aa,id_in,population_in)
#
dict_display_proc(dict_bb)
#
json_str_out = JSON.pretty_generate(dict_bb)
#
RestClient.put url_target, json_str_out
#
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
