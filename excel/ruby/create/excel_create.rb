#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	excel_create.rb
#
#					Jul/15/2013
#
# -------------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/excel_manipulate.rb'
# -------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2971","奈良",34567,"2006-5-16")
	dict_aa=dict_append_proc(dict_aa,"t2972","大和高田",43579,"2006-8-9")
	dict_aa=dict_append_proc(dict_aa,"t2973","大和郡山",92541,"2006-4-21")
	dict_aa=dict_append_proc(dict_aa,"t2974","天理",21568,"2006-2-15")
	dict_aa=dict_append_proc(dict_aa,"t2975","橿原",25617,"2006-10-24")
	dict_aa=dict_append_proc(dict_aa,"t2976","桜井",56124,"2006-9-12")
	dict_aa=dict_append_proc(dict_aa,"t2977","五條",39257,"2006-2-21")
	dict_aa=dict_append_proc(dict_aa,"t2978","御所",92614,"2006-8-12")
	dict_aa=dict_append_proc(dict_aa,"t2979","生駒",28396,"2006-9-28")
#
	return	dict_aa
end
# -------------------------------------------------------------------

puts	"*** 開始 ***"

excel_file = ARGV[0]

dict_aa = data_prepare_proc()

excel_write_proc(excel_file,dict_aa)

dict_display_proc(dict_aa)

puts	"*** 終了 ***"
#
