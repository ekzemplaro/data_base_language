#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/text_create.rb
#
#					Jun/09/2011
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2381","名古屋",42726,"2006-2-25")
	dict_aa=dict_append_proc(dict_aa,"t2382","豊橋",29819,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t2383","岡崎",51872,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t2384","一宮",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t2385","蒲郡",84143,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2386","常滑",21589,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t2387","大府",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t2388","瀬戸",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2389","犬山",74326,"2006-10-27")
#
	return	dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
text_file = ARGV[0]
#
dict_aa = data_prepare_proc()
#
dict_display_proc(dict_aa)
#
text_write_proc(text_file,dict_aa)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
