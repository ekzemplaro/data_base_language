#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	csv_ruby_create.rb
#
#					Jan/20/2011
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,'t1271',"千葉",42700,"2006-7-15")
	dict_aa=dict_append_proc(dict_aa,'t1272',"勝浦",29500,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,'t1273',"市原",57200,"2006-2-9")
	dict_aa=dict_append_proc(dict_aa,'t1274',"流山",32700,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,'t1275',"八千代",14100,"2006-6-24")
	dict_aa=dict_append_proc(dict_aa,'t1276',"我孫子",21600,"2006-4-17")
	dict_aa=dict_append_proc(dict_aa,'t1277',"鴨川",69300,"2006-5-8")
	dict_aa=dict_append_proc(dict_aa,'t1278',"銚子",52800,"2006-9-15")
	dict_aa=dict_append_proc(dict_aa,'t1279',"市川",74600,"2006-11-27")
#
	return	dict_aa

end
# -------------------------------------------------------------
csv_file = "/var/tmp/csv/cities.csv"
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
#
csv_write_proc(csv_file,dict_aa)
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
