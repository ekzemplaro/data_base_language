#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	excel_ruby_create.rb
#
#					Jun/28/2012
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/excel_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,'t2971',"奈良",42900,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,'t2972',"大和高田",85100,"2006-1-17")
	dict_aa=dict_append_proc(dict_aa,'t2973',"大和郡山",36200,"2006-8-9")
	dict_aa=dict_append_proc(dict_aa,'t2974',"天理",42700,"2006-4-21")
	dict_aa=dict_append_proc(dict_aa,'t2975',"橿原",98600,"2006-6-24")
	dict_aa=dict_append_proc(dict_aa,'t2976',"桜井",87500,"2006-7-17")
	dict_aa=dict_append_proc(dict_aa,'t2977',"五條",69300,"2006-5-8")
	dict_aa=dict_append_proc(dict_aa,'t2978',"御所",54100,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,'t2979',"生駒",74600,"2006-11-27")
#
	return	dict_aa

end
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
file_excel = "/var/tmp/excel/cities.xls"
#
dict_aa=prepare_data_proc()
#
#
excel_write_proc(file_excel,dict_aa)
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
