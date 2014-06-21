#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	basex_update.rb
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
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
url_base='http://localhost:8984/rest/cities'
url_aa= url_base + '?query=/'
#
client = RestClient::Resource.new url_aa,'admin','admin'
xml_str = client.get
#
#print xml_str
dict_aa=xml_to_dict_proc(xml_str)
dict_aa=dict_update_proc(dict_aa,id_in,population_in)
dict_display_proc(dict_aa)
#
xml_str_new=dict_to_xml_proc(dict_aa)
#
client = RestClient::Resource.new url_base,'admin','admin'
client.put xml_str_new, :content_type => 'application/xml'
#
puts	"*** 終了 ***"
