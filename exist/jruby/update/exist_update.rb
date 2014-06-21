#! /usr/bin/jruby
#
#	exist_update.rb
#
#					May/19/2011
#
require "rexml/document"
require	"net/http"
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
host= "localhost"
port = 8086
path="/exist/rest/cities/cities.xml"
#
Net::HTTP.start(host,port)do |http|
		contents=http.get(path)
#		print contents.body
		dict_aa=xml_to_dict_proc(contents.body)
		dict_aa=dict_update_proc(dict_aa,id_in,population_in)
		dict_display_proc(dict_aa)
		str_xml=dict_to_xml_proc(dict_aa)
		http.put(path,str_xml)
	end
#
#
puts	"*** 終了 ***"
