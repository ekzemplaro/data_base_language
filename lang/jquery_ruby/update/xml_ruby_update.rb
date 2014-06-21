#! /usr/bin/ruby
#
#	xml_ruby_update.rb
#
#					May/16/2011
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** xml_ruby_update.rb **** aaa<br />"
hhh = parse_parameter()
print "*** xml_ruby_update.rb **** bbb<br />"
#
xml_file = "/var/tmp/xml_file/cities.xml"
#
xml_str = read_string_proc(xml_file)
print "*** xml_ruby_update.rb **** pppp<br />"

dict_aa=xml_to_dict_proc(xml_str)
print "*** xml_ruby_update.rb **** qqqq<br />"
#
hhh.each do |unit|
	print "*** bbbb ***<p />"
	id = unit["id"]
	population=unit["population"].to_i
	dict_update_proc(dict_aa,id,population)
end
#
print "*** cccc ***<p />"
str_out=dict_to_xml_proc(dict_aa)
#
file_write_proc(xml_file,str_out)
#
print "*** end ***<p />"
