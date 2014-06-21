#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	xml_file/ruby/create/xml_create.rb
#
#					May/19/2011
#
# ------------------------------------------------------------
require "rexml/document"
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
#
include REXML
#
# ------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2261","静岡",42726,"2006-2-25")
	dict_aa=dict_append_proc(dict_aa,"t2262","浜松",29519,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t2263","沼津",51472,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t2264","三島",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t2265","富士",84141,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2266","熱海",21581,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t2267","富士宮",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t2268","藤枝",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2269","御殿場",14392,"2006-10-27")
	dict_aa=dict_append_proc(dict_aa,"t2270","島田",78358,"2006-12-9")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts	"*** 開始 *** xml_create.rb ***"
#
xml_file = ARGV[0]
#
puts xml_file
#
dict_aa = prepare_data_proc()
dict_display_proc(dict_aa)
#
str_out=dict_to_xml_proc(dict_aa)
#
file_write_proc(xml_file,str_out)
#
puts	"*** 終了 *** xml_create.rb ***"
#
# ------------------------------------------------------------
