#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	exist_delete.rb
#
#					Mar/28/2013
#
require "rexml/document"
require	"restclient"
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'

include REXML
# -----------------------------------------------------------------
puts	"*** 開始 ***"
#
id_in = ARGV[0]
#
puts id_in
#
url_in='http://localhost:8086/exist/rest/db/cities/cities.xml'
xml_str = RestClient.get url_in
#
#print xml_str
dict_aa=xml_to_dict_proc(xml_str)
dict_aa=dict_delete_proc(dict_aa,id_in)
dict_display_proc(dict_aa)
#
str_out=dict_to_xml_proc(dict_aa)
#
RestClient.put url_in, str_out
#
puts	"*** 終了 ***"
#
