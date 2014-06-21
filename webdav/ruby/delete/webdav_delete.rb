#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	webdav_delete.rb
#
#					Jan/23/2012
# --------------------------------------------------------------------------
require 'rubygems'
require 'open-uri'
require 'json'
require 'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
#
puts key_in
#
url_target='http://cddn007:3004/city/tokyo.json'
response= open(url_target,:proxy=>nil)
json_str=response.read
#
#
dict_aa=JSON.parse(json_str)
#
if (dict_aa.key?(key_in))
	dict_aa = dict_delete_proc(dict_aa,key_in)
	dict_display_proc(dict_aa)
	json_str_out = JSON.pretty_generate(dict_aa)
	RestClient.put url_target, json_str_out
end
#
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
