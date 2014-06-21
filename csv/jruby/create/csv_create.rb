#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	create/csv_create.rb
#
#					Jul/02/2011
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t1271","千葉",17626,"2007-2-25")
	dict_aa=dict_append_proc(dict_aa,"t1272","勝浦",29819,"2007-7-27")
	dict_aa=dict_append_proc(dict_aa,"t1273","市原",51872,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t1274","流山",27615,"2007-1-21")
	dict_aa=dict_append_proc(dict_aa,"t1275","八千代",85162,"2007-5-24")
	dict_aa=dict_append_proc(dict_aa,"t1276","我孫子",21581,"2007-4-7")
	dict_aa=dict_append_proc(dict_aa,"t1277","鴨川",42693,"2007-4-8")
	dict_aa=dict_append_proc(dict_aa,"t1278","銚子",54197,"2007-8-15")
	dict_aa=dict_append_proc(dict_aa,"t1279","市川",28936,"2007-10-27")
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
csv_write_proc(text_file,dict_aa)
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
