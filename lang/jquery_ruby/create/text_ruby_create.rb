#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	text_ruby_create.rb
#
#					Jun/20/2011
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,'t2381',"名古屋",74200,"2006-3-21")
	dict_aa=dict_append_proc(dict_aa,'t2382',"豊橋",29800,"2006-9-27")
	dict_aa=dict_append_proc(dict_aa,'t2383',"岡崎",57200,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,'t2384',"一宮",32700,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,'t2385',"蒲郡",18600,"2006-6-24")
	dict_aa=dict_append_proc(dict_aa,'t2386',"常滑",27500,"2006-4-17")
	dict_aa=dict_append_proc(dict_aa,'t2387',"大府",69300,"2006-5-8")
	dict_aa=dict_append_proc(dict_aa,'t2388',"瀬戸",54100,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,'t2389',"犬山",74600,"2006-11-27")
#
	return	dict_aa

end
# -------------------------------------------------------------
text_file = "/var/tmp/plain_text/cities.txt"
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
#
#
text_write_proc(text_file,dict_aa)
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
