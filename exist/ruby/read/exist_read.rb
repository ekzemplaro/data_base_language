#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	exist_read.rb
#
#					May/16/2011
#
require 'restclient'
require "rexml/document"
include REXML
#
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# -----------------------------------------------------------------
puts	"*** 開始 ***"
#
url_in='http://localhost:8086/exist/rest/db/cities/cities.xml'
xml_str = RestClient.get url_in
#
#print xml_str
dict_aa=xml_to_dict_proc(xml_str)
dict_display_proc(dict_aa)
#
puts "*** 終了 ***"
# -----------------------------------------------------------------
