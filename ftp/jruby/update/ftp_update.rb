#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	ftp_update.rb
#
#					Sep/03/2015
# ---------------------------------------------------------------------
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
host='host_dbase'
user='scott'
pass='tiger'
target_file='city/iwate.json'

url='ftp://' + user + ':' + pass + '@' + host + '/' + target_file
response= open(url,:proxy=>nil)
str_json=response.read
#
#
dict_aa=JSON.parse(str_json)
#
dict_aa=dict_update_proc(dict_aa,id_in,population_in)
#
json_str = JSON(dict_aa)
#
ftp_put_proc(host,user,pass,target_file,json_str)
#
puts	"*** 終了 ***"
#
