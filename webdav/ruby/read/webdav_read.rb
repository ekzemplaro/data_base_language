#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	webdav_read.rb
#
#					Mar/18/2013
#
require 'rubygems'
require 'open-uri'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
#
puts	"*** 開始 ***"
#
url='http://cddn007:3004/city/tokyo.json'
response= open(url,:proxy=>nil)
str_json=response.read
#
#puts str_json
#
dict_aa=JSON.parse(str_json)
#
dict_display_proc(dict_aa)

#json_display_proc(str_json)
#
puts	"*** 終了 ***"
#
