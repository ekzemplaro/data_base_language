#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	couch_read.rb
#
#					Apr/26/2011
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
response= open('http://cddn007:5984/city/cities',:proxy=>nil)
str_json=response.read
#
#
dict_aa=JSON.parse(str_json)
#
dict_display_proc(dict_aa)
#
puts	"*** 終了 ***"
#
