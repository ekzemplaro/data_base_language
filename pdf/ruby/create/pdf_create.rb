#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	pdf_create.rb
#
#					Jun/27/2012
#
# ---------------------------------------------------------------------
#require	'rubygems'
#require	'hpdf'
#require	'PDF'
#require	'kconv'

load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/pdf_manipulate.rb'
# ---------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2531","大津",78539,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2532","草津",95154,"2006-3-17")
	dict_aa=dict_append_proc(dict_aa,"t2533","守山",51872,"2006-2-9")
	dict_aa=dict_append_proc(dict_aa,"t2534","栗東",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t2535","野洲",84143,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2536","甲賀",21581,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t2537","湖南",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t2538","近江八幡",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2539","彦根",74326,"2006-10-27")
#
	return	dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
file_pdf = ARGV[0]
#
puts file_pdf

dict_aa = data_prepare_proc()

dict_to_pdf_proc(file_pdf,dict_aa)

puts	"*** 終了 ***"
# ---------------------------------------------------------------------
