#! /usr/bin/ruby
#
#	csv_ruby_delete.rb
#
#					Jul/13/2011
#
require	"cgi"
require	"json"
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
print "*** csv_ruby_delete.rb ****<br />"
hhh = parse_parameter()
#
file_in = "/var/tmp/csv/cities.csv"
#
dict_aa = csv_read_proc(file_in)
#
hhh.each do |unit|
	id = unit
	dict_aa=dict_delete_proc(dict_aa,id)
end
#
print "*** bbbb May/19/2011 ***<p />"
csv_write_proc(file_in,dict_aa)
#
print "*** end ***<p />"
