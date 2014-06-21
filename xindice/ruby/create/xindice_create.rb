#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	xindice_create.rb
#
#					May/16/2011
#
# ------------------------------------------------------------
require "rexml/document"
require	"restclient"
#
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
include REXML
# ------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t0271","青森",42726,"2006-2-25")
	dict_aa=dict_append_proc(dict_aa,"t0272","弘前",29819,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t0273","八戸",51872,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t0274","三沢",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t0275","黒石",84141,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t0276","むつ",21581,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t0277","五所川原",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t0278","十和田",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t0279","平川",74324,"2006-10-27")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts	"*** 開始 ***"
#
dict_aa=prepare_data_proc()
#
xml_str=dict_to_xml_proc(dict_aa)
#
url_target='http://cdbd026:8888/xindice/db/cities/cities'
#
RestClient.put url_target, xml_str
#
puts	"*** 終了 ***"
#
# ------------------------------------------------------------
