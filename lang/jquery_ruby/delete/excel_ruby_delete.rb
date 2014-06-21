#! /usr/bin/ruby
#
#	excel_ruby_delete.rb
#
#					Jun/28/2012
#
require	"cgi"
require	"json"
require 'spreadsheet'
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/excel_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
hhh = parse_parameter()
#
file_excel = "/var/tmp/excel/cities.xls"
#
dict_aa = excel_read_proc(file_excel)
#
hhh.each do |unit|
	id = unit
	dict_aa=dict_delete_proc(dict_aa,id)
end
#
excel_write_proc(file_excel,dict_aa)
#
print "*** end ***<p />"
