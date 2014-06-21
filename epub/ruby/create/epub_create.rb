#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	epub_create.rb
#
#					Jul/10/2012
#
# ---------------------------------------------------------------------
require	'rubygems'
require	'hpdf'
require	'kconv'
require	'fileutils'

load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/epub_manipulate.rb'
# ---------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t1931","甲府",53926,"2006-9-12")
	dict_aa=dict_append_proc(dict_aa,"t1932","富士吉田",91584,"2006-4-21")
	dict_aa=dict_append_proc(dict_aa,"t1933","都留",51872,"2006-2-9")
	dict_aa=dict_append_proc(dict_aa,"t1934","山梨",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t1935","大月",84173,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t1936","韮崎",21581,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t1937","南アルプス",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t1938","北杜",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t1939","甲斐",71326,"2006-10-27")
#
	return	dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
file_epub = ARGV[0]
#
puts file_epub

dict_aa = data_prepare_proc()

dict_to_epub_proc(file_epub,dict_aa)

puts	"*** 終了 ***"
# ---------------------------------------------------------------------
