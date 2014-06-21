#! /usr/bin/ruby
#
#	xml_ruby_delete.rb
#
#					May/16/2011
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** xml_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
xml_file = "/var/tmp/xml_file/cities.xml"
#
xml_str = read_string_proc(xml_file)
print "*** xml_ruby_delete.rb **** pppp<br />"

dict_aa=xml_to_dict_proc(xml_str)
#
hhh.each do |unit|
	id = unit
	dict_aa = dict_delete_proc(dict_aa,id)
end
#
print "*** bbbb ***<p />"
str_out=dict_to_xml_proc(dict_aa)
#
file_write_proc(xml_file,str_out)
#
print "*** end ***<p />"
