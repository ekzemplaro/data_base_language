#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	ftp_update.rb
#
#					Jan/18/2012
#
require 'rubygems'
require 'open-uri'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
#
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
url='ftp://scott:tiger@cddn007/city/iwate.json'
response= open(url,:proxy=>nil)
str_json=response.read
#
#
dict_aa=JSON.parse(str_json)
#
dict_aa=dict_update_proc(dict_aa,id_in,population_in)

dict_display_proc(dict_aa)
#
json_str = JSON(dict_aa)

host='cddn007'
user='scott'
pass='tiger'
target_file='city/iwate.json'
ftp_put_proc(host,user,pass,target_file,json_str)
#
puts	"*** 終了 ***"
#
