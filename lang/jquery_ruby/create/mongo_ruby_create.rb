#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	mongo_ruby_create.rb
#
#					May/12/2015
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mongo_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,'t1161',"さいたま",28700,"2006-5-25")
	dict_aa=dict_append_proc(dict_aa,'t1162',"所沢",29500,"2006-6-17")
	dict_aa=dict_append_proc(dict_aa,'t1163',"越谷",57100,"2006-7-8")
	dict_aa=dict_append_proc(dict_aa,'t1164',"久喜",32700,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,'t1165',"熊谷",18600,"2006-6-24")
	dict_aa=dict_append_proc(dict_aa,'t1166',"秩父",27500,"2006-4-17")
	dict_aa=dict_append_proc(dict_aa,'t1167',"川越",69300,"2006-5-8")
	dict_aa=dict_append_proc(dict_aa,'t1168',"和光",54100,"2006-12-15")
	dict_aa=dict_append_proc(dict_aa,'t1169',"新座",65200,"2006-8-27")
#
	return	dict_aa

end
# -------------------------------------------------------------
dict_aa=prepare_data_proc()
#
dict_to_mongo_proc(dict_aa)
#
puts "Content-type: text/html\n\n"
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
