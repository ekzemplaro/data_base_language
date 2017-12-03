#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	ruby/create/text_create.rb
#
#					Nov/27/2017
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2381","名古屋",41726,"2006-3-25")
	dict_aa=dict_append_proc(dict_aa,"t2382","豊橋",29813,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t2383","岡崎",51872,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t2384","一宮",27945,"2006-1-15")
	dict_aa=dict_append_proc(dict_aa,"t2385","蒲郡",87163,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2386","常滑",21589,"2006-8-7")
	dict_aa=dict_append_proc(dict_aa,"t2387","大府",42693,"2006-4-21")
	dict_aa=dict_append_proc(dict_aa,"t2388","瀬戸",54187,"2006-8-12")
	dict_aa=dict_append_proc(dict_aa,"t2389","犬山",79326,"2006-10-28")
#
	return	dict_aa
end
# ---------------------------------------------------------------------
STDERR.puts	"*** 開始 ***"
text_file = ARGV[0]
#
dict_aa = data_prepare_proc()
#
text_write_proc(text_file,dict_aa)
#
STDERR.puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
