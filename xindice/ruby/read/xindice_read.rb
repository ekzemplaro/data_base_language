#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#	xindice_read.rb
#
#						May/16/2011
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
url_in="http://cdbd026:8888/xindice/db/cities/cities"
#
xml_str = RestClient.get url_in
dict_aa=xml_to_dict_proc(xml_str)
dict_display_proc(dict_aa)
#
puts "*** 終了 ***"
# ------------------------------------------------------------
