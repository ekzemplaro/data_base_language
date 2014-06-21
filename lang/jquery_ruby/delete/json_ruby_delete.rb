#! /usr/bin/ruby
#
#	json_ruby_delete.rb
#
#					Jul/13/2011
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/file_io.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** json_ruby_delete.rb ****<br />"
#
hhh = parse_parameter()
#
json_file = "/var/tmp/json/cities.json"
#
json_str = read_string_proc(json_file)
#
dict_aa=JSON.parse(json_str)
print "*** ccc ***<p />"
#
#
hhh.each do |unit|
	id = unit
	print "*** ddd ***<p />"
	dict_aa=dict_delete_proc(dict_aa,id)
	print "*** eee ***<p />"
end
print "*** fff ***<p />"
#
json_out = JSON.pretty_generate(dict_aa)
file_write_proc(json_file,json_out)
#
print "*** end ***<p />"
