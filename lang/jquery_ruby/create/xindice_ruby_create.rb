#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	exist_ruby_create.rb
#
#					May/16/2011
# -------------------------------------------------------------
require "rexml/document"
require	"restclient"
#
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t0271","青森",75200,"2006-4-21")
	dict_aa=dict_append_proc(dict_aa,"t0272","弘前",93600,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t0273","八戸",51800,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t0274","三沢",27500,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t0275","黒石",84100,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t0276","むつ",21500,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t0277","五所川原",49300,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t0278","十和田",54700,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t0279","平川",74300,"2006-10-27")
#
	return	dict_aa
#
end
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
xml_str=dict_to_xml_proc(dict_aa)
#
url_target='http://cdbd026:8888/xindice/db/cities/cities'
#
RestClient.put url_target, xml_str
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
