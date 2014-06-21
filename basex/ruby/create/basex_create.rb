#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	basex_create.rb
#
#					Jul/27/2012
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
	dict_aa=dict_append_proc(dict_aa,"t4161","佐賀",76854,"2006-9-25")
	dict_aa=dict_append_proc(dict_aa,"t4162","唐津",29819,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t4163","鳥栖",81292,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t4164","多久",48965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t4165","伊万里",85741,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t4166","武雄",21583,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t4167","鹿島",42692,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t4168","小城",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t4169","嬉野",74324,"2006-10-27")
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
url_target='http://localhost:8984/rest/cities'
#
client = RestClient::Resource.new url_target,'admin','admin' 
client.put xml_str, :content_type => 'application/xml'
#
puts	"*** 終了 ***"
#
# ------------------------------------------------------------
