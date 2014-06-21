#! /usr/bin/jruby
#
#	exist_read.rb
#
#					May/19/2011
#
require "rexml/document"
require	"net/http"
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
include REXML
#
# -----------------------------------------------------------------
print	"*** 開始 ***\n"
#
host= "localhost"
port = 8086
path="/exist/rest/cities/cities.xml"
#
Net::HTTP.start(host,port)do |http|
		contents=http.get(path)
#		print contents.body
		dict_aa=xml_to_dict_proc(contents.body)
		dict_display_proc(dict_aa)
	end
#
print	"*** 終了 ***\n"
# -----------------------------------------------------------------
