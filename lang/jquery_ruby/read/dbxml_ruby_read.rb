#! /usr/bin/ruby
#
#	read/dbxml_read_ruby.rb
#
#					Mar/23/2010
#
require "rexml/document"
require	"open-uri"
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/xml_to_json.rb'
#
user='scott'
password='tiger'
collections='cities'
xml_file='cities.xml'
#
uri="http://cpt003:7280/rest/"
uri+=collections + "/" + xml_file
#
response=open(uri,:http_basic_authentication=>[user, password]).read
#
#
jyy = Xml_to_json.new
str_out = jyy.xml_to_json_proc(response)
puts "Content-type: text/json\n\n"
puts str_out
#
#
#
#
#
