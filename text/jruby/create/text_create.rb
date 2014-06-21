#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/text_create.rb
#
#					Jun/09/2011
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2381","名古屋",37126,"2007-5-16")
	dict_aa=dict_append_proc(dict_aa,"t2382","豊橋",29819,"2007-7-27")
	dict_aa=dict_append_proc(dict_aa,"t2383","岡崎",51872,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t2384","一宮",27965,"2007-1-21")
	dict_aa=dict_append_proc(dict_aa,"t2385","蒲郡",84137,"2007-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2386","常滑",21589,"2007-4-7")
	dict_aa=dict_append_proc(dict_aa,"t2387","大府",42693,"2007-4-8")
	dict_aa=dict_append_proc(dict_aa,"t2388","瀬戸",54197,"2007-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2389","犬山",74526,"2007-10-27")
#
	return	dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
text_file = ARGV[0]
#
dict_aa = prepare_data_proc()
#
dict_display_proc(dict_aa)
#
text_write_proc(text_file,dict_aa)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
