#! /usr/bin/ruby
#
#	read/xindice_read_ruby.rb
#
#					Jul/09/2011
#
require "rexml/document"
require	"restclient"
require	"json"
#
include REXML
#
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
#
# -----------------------------------------------------------------
url_in='http://cdbd026:8888/xindice/db/cities/cities'
xml_str = RestClient.get url_in
#
dict_aa=xml_to_dict_proc(xml_str)
json_str = JSON.pretty_generate(dict_aa)
#
puts "Content-type: text/json\n\n"
puts json_str
#
#
