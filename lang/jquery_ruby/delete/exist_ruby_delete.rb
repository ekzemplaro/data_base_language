#! /usr/bin/ruby
#
#	exist_ruby_delete.rb
#
#					May/16/2011
#
require "rexml/document"
require	"restclient"
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
#
include REXML
#
# -----------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** exist_ruby_delete.rb *** aaa<br />"
hhh = parse_parameter()
#
url_in='http://localhost:8086/exist/rest/db/cities/cities.xml'
xml_str = RestClient.get url_in
#
print "*** exist_ruby_delete.rb *** bbb<br />"
dict_aa=xml_to_dict_proc(xml_str)
print "*** exist_ruby_delete.rb *** ccc<br />"
#
hhh.each do |unit|
	id = unit
	dict_aa=dict_delete_proc(dict_aa,id)
	print id,"<br />"
end
#
str_out=dict_to_xml_proc(dict_aa)
#
RestClient.put url_in, str_out
#
print "*** exist_ruby_delete.rb **** end ***<br />"
#
