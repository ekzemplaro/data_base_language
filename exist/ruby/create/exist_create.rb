#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	create/exist_create.rb
#
#					Jun/05/2013
#
# ------------------------------------------------------------
require "rexml/document"
require	"restclient"
#
require "rexml/document"
load '/var/www/data_base/common/ruby_common/xml_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
include REXML
# ------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t4251","長崎",42186,"2006-2-25")
	dict_aa=dict_append_proc(dict_aa,"t4252","佐世保",29819,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t4253","島原",51876,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t4254","大村",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t4255","諫早",84145,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t4256","五島",27581,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t4257","平戸",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t4258","雲仙",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t4259","松浦",79324,"2006-10-27")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts	"*** 開始 *** exist_create.rb ***"
#
dict_aa=prepare_data_proc()
#
xml_str=dict_to_xml_proc(dict_aa)
#
#url_target='http://localhost:8086/exist/rest/db/cities/cities.xml'
url_target='http://localhost:8086/exist/rest/cities/cities.xml'
RestClient.put url_target, xml_str
#
puts	"*** 終了 *** xml_create.rb ***"
#
# ------------------------------------------------------------
