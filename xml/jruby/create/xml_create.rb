#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	create/xml_create.rb
#
#					May/19/2011
#
# ------------------------------------------------------------
include	Java
import	java.lang.System
#
require "rexml/document"
include REXML
#
load '/var/www/data_base/common/ruby_common/file_io.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
# ------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t2261","静岡",63152,"2007-4-15")
	dict_aa=dict_append_proc(dict_aa,"t2262","浜松",29819,"2007-7-27")
	dict_aa=dict_append_proc(dict_aa,"t2263","沼津",51872,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t2264","三島",27965,"2007-1-21")
	dict_aa=dict_append_proc(dict_aa,"t2265","富士",84143,"2007-5-24")
	dict_aa=dict_append_proc(dict_aa,"t2266","熱海",21587,"2007-4-7")
	dict_aa=dict_append_proc(dict_aa,"t2267","富士宮",42693,"2007-4-8")
	dict_aa=dict_append_proc(dict_aa,"t2268","藤枝",54187,"2007-8-15")
	dict_aa=dict_append_proc(dict_aa,"t2269","御殿場",14392,"2007-10-27")
	dict_aa=dict_append_proc(dict_aa,"t2270","島田",78358,"2007-12-9")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts	"*** 開始 *** xml_create.rb ***"
System.out.println("*** 開始 ***")
#
xml_file = ARGV[0]
#
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
#
puts	"*** 終了 *** xml_create.rb ***"
System.out.println("*** 終了 ***")
#
# ------------------------------------------------------------
