#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	ftp_delete.rb
#
#					Jan/23/2012
# --------------------------------------------------------------------------
require 'rubygems'
require 'net/ftp'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
#
# --------------------------------------------------------------------------
puts "*** 開始 ***"
key_in = ARGV[0]
#
puts key_in
#
host='cddn007'
user='scott'
pass='tiger'
target_file='city/iwate.json'
#
json_str = ftp_get_proc(host,user,pass,target_file)
#
dict_aa=JSON.parse(json_str)
#
if (dict_aa.key?(key_in))
	dict_aa = dict_delete_proc(dict_aa,key_in)
	dict_display_proc(dict_aa)
	str_json_out = JSON.pretty_generate(dict_aa)
	ftp_put_proc(host,user,pass,target_file,str_json_out)
end
#
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
