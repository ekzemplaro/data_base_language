#! /usr/bin/ruby
#
#	json_ruby_update.rb
#
#					Jun/10/2011
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
print "*** json_ruby_update.rb ****<br />"
hhh = parse_parameter()
#
print "*** aaa ***<p />"
json_file = "/var/tmp/json/cities.json"
#
print "*** bbb ***<p />"
json_str = read_string_proc(json_file)
print "*** ccc ***<p />"
#
dict_aa=JSON.parse(json_str)
print "*** ddd ***<p />"
#
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	print "*** ddd ***<p />"
	dict_aa=dict_update_proc(dict_aa,id,population)
	print "*** eee ***<p />"
end
print "*** fff ***<p />"
#
json_out = JSON.pretty_generate(dict_aa)
file_write_proc(json_file,json_out)
#
print "*** end ***<p />"
