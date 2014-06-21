#! /usr/bin/ruby
#
#	xindice_update.rb
#
#					May/16/2011
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
url_in='http://cdbd026:8888/xindice/db/cities/cities'
xml_str = RestClient.get url_in
#
#print xml_str
dict_aa=xml_to_dict_proc(xml_str)
dict_aa=dict_update_proc(dict_aa,id_in,population_in)
dict_display_proc(dict_aa)
#
str_out=dict_to_xml_proc(dict_aa)
#
RestClient.put url_in, str_out
#
puts	"*** 終了 ***"
