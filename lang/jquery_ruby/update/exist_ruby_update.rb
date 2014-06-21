#! /usr/bin/ruby
#
#	update/exist_update_ruby.rb
#
#					May/16/2011
#
require "rexml/document"
require	"restclient"
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
include REXML
#
# -----------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** exist_ruby_update.rb *** aaa<br />"
hhh = parse_parameter()
#
url_in='http://localhost:8086/exist/rest/db/cities/cities.xml'
xml_str = RestClient.get url_in
#
dict_aa=xml_to_dict_proc(xml_str)
#
print "*** exist_ruby_update.rb *** bbb<br />"
hhh.each do |unit|
	print "*** exist_ruby_update.rb *** ccc<br />"
	id = unit["id"]
	population=unit["population"].to_i
	dict_aa=dict_update_proc(dict_aa,id,population)
	print id,population,"<br />"
end
#
str_out=dict_to_xml_proc(dict_aa)
#
RestClient.put url_in, str_out
#
print "*** exist_ruby_update.rb **** end ***<br />"
#
