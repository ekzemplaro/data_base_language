#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	xlsx_create.rb
#					Aug/07/2013
#
# --------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/xlsx_manipulate.rb'
# --------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2971","奈良",71564,"2007-8-26")
	dict_aa=dict_append_proc(dict_aa,"t2972","大和高田",29478,"2007-4-27")
	dict_aa=dict_append_proc(dict_aa,"t2973","大和郡山",58726,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t2974","天理",37965,"2007-1-21")
	dict_aa=dict_append_proc(dict_aa,"t2975","橿原",84137,"2007-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2976","桜井",71589,"2007-4-7")
	dict_aa=dict_append_proc(dict_aa,"t2977","五條",42693,"2007-4-8")
	dict_aa=dict_append_proc(dict_aa,"t2978","御所",54197,"2007-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2979","生駒",73526,"2007-10-27")
#
	return	dict_aa
end
# --------------------------------------------------------
puts "*** 開始 ***"
xlsx_file=ARGV[0]
#
dict_aa = prepare_data_proc()

dict_display_proc(dict_aa)

xlsx_write_proc(xlsx_file,dict_aa)

puts "*** 終了 ***"
# --------------------------------------------------------
