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
include REXML
# -------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t4251","長崎",27500,"2006-9-21")
	dict_aa=dict_append_proc(dict_aa,"t4252","佐世保",93600,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t4253","島原",51800,"2006-8-8")
	dict_aa=dict_append_proc(dict_aa,"t4254","大村",27900,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t4255","諫早",84100,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t4256","五島",21500,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t4257","平戸",42600,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t4258","雲仙",54100,"2006-8-19")
	dict_aa=dict_append_proc(dict_aa,"t4259","松浦",72400,"2006-11-7")
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
url_target='http://localhost:8086/exist/rest/db/cities/cities.xml'
RestClient.put url_target, xml_str
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
