#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_create.rb
#
#						Jul/09/2015
#
require 'dalli'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t1731","金沢",45726,"2006-8-25")
	dict_aa=dict_append_proc(dict_aa,"t1732","輪島",27813,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t1733","小松",51872,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t1734","七尾",27945,"2006-1-15")
	dict_aa=dict_append_proc(dict_aa,"t1735","珠洲",84163,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t1736","加賀",21539,"2006-12-7")
	dict_aa=dict_append_proc(dict_aa,"t1737","羽咋",42693,"2006-4-21")
	dict_aa=dict_append_proc(dict_aa,"t1738","かほく",54187,"2006-8-12")
	dict_aa=dict_append_proc(dict_aa,"t1739","白山",79316,"2006-10-28")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa = data_prepare_proc()
#
dc = Dalli::Client.new('localhost:11211')
#
dict_aa.each {|key, value|
	json_str = JSON.generate(value)
	dc.set(key,json_str)
	}
#
puts "*** 終了 ***"
# ------------------------------------------------------------

