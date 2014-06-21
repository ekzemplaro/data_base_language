#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	pdf_ruby_create.rb
#
#					Jun/28/2012
# -------------------------------------------------------------
require	'rubygems'
require	'hpdf'
require	'kconv'

load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/pdf_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,'t2531',"大津",39200,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,'t2532',"草津",19800,"2006-8-17")
	dict_aa=dict_append_proc(dict_aa,'t2533',"守山",97200,"2006-1-7")
	dict_aa=dict_append_proc(dict_aa,'t2534',"栗東",42700,"2006-5-21")
	dict_aa=dict_append_proc(dict_aa,'t2535',"野洲",18600,"2006-6-24")
	dict_aa=dict_append_proc(dict_aa,'t2536',"甲賀",27500,"2006-4-17")
	dict_aa=dict_append_proc(dict_aa,'t2537',"湖南",69300,"2006-5-8")
	dict_aa=dict_append_proc(dict_aa,'t2538',"近江八幡",54100,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,'t2539',"彦根",24800,"2006-10-27")
#
	return	dict_aa

end
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
file_pdf = "/var/tmp/pdf/cities.pdf"
#
dict_aa=prepare_data_proc()
#
dict_to_pdf_proc(file_pdf,dict_aa)
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
