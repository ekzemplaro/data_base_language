#! /usr/bin/ruby
#
#	pdf_ruby_update.rb
#
#					Jun/28/2012
#
require	"cgi"
require	"json"
require	'rubygems'
require	'hpdf'
require	'kconv'
#
load '/var/www/data_base/common/ruby_common/cgi_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/pdf_manipulate.rb'
# ---------------------------------------------------------------------
print "Content-type: text/html\n\n"
#
hhh = parse_parameter()
#
file_pdf = "/var/tmp/pdf/cities.pdf"
#
dict_aa = pdf_to_dict_proc(file_pdf)
#
hhh.each do |unit|
	id = unit["id"]
	population=unit["population"].to_i
	dict_aa = dict_update_proc(dict_aa,id,population)
end
#
dict_to_pdf_proc(file_pdf,dict_aa)
#
print "*** end ***<p />"
