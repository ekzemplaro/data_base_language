#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	ftp_update.rb
#
#					Sep/12/2011
# --------------------------------------------------------------------------
#
require 'rubygems'
require 'net/ftp'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
# --------------------------------------------------------------------------
#
puts "*** 開始 ***"
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
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
dict_aa = dict_update_proc(dict_aa,id_in,population_in)
#
dict_display_proc(dict_aa)
#
str_json_out = JSON.pretty_generate(dict_aa)
#
ftp_put_proc(host,user,pass,target_file,str_json_out)
#
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
