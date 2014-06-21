#! /usr/bin/ruby
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
	dict_aa=dict_append_proc(dict_aa,"t1271","千葉",21267,"2006-12-21")
	dict_aa=dict_append_proc(dict_aa,"t1272","勝浦",29819,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t1273","市原",51872,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t1274","流山",27365,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t1275","八千代",84141,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t1276","我孫子",21581,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t1277","鴨川",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t1278","銚子",19723,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,"t1279","市川",48265,"2006-8-27")
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
