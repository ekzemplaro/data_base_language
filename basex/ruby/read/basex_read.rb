#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#	basex_read.rb
#
#						Oct/27/2011
#
# ------------------------------------------------------------
require "rexml/document"
require "restclient"
#
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
include REXML
#
# ------------------------------------------------------------
puts	"*** 開始 ***"
#
url_in="http://admin:admin@localhost:8984/rest/cities?query=/"
#
xml_str = RestClient.get url_in
dict_aa=xml_to_dict_proc(xml_str)
dict_display_proc(dict_aa)
#
puts "*** 終了 ***"
# ------------------------------------------------------------
