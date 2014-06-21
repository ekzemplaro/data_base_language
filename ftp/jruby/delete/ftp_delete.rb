#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	ftp_delete.rb
#
#					Jan/23/2012
#
require 'rubygems'
require 'open-uri'
require 'json'
#
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
#
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
#
key_in = ARGV[0]
#
puts key_in
#
url='ftp://scott:tiger@cddn007/city/iwate.json'
response= open(url,:proxy=>nil)
str_json=response.read
#
#
dict_aa=JSON.parse(str_json)
#
if (dict_aa.key?(key_in))
	dict_aa.delete(key_in)
	dict_display_proc(dict_aa)
	json_str = JSON(dict_aa)
	host='cddn007'
	user='scott'
	pass='tiger'
	target_file='city/iwate.json'
	ftp_put_proc(host,user,pass,target_file,json_str)
end
#
puts	"*** 終了 ***"
#
