#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	webdav_create.rb
#
#					Mar/18/2013
#
require 'rubygems'
require 'json'
require 'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
#
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}

dict_aa=dict_append_proc(dict_aa,"t1351","八王子",39287,"2006-10-19")
dict_aa=dict_append_proc(dict_aa,"t1352","立川",23864,"2006-7-27")
dict_aa=dict_append_proc(dict_aa,"t1353","武蔵野",45972,"2006-2-8")
dict_aa=dict_append_proc(dict_aa,"t1354","三鷹",78623,"2006-1-22")
dict_aa=dict_append_proc(dict_aa,"t1355","青梅",41389,"2006-5-11")
dict_aa=dict_append_proc(dict_aa,"t1356","府中",16925,"2006-9-17")
dict_aa=dict_append_proc(dict_aa,"t1357","昭島",36972,"2006-8-18")
dict_aa=dict_append_proc(dict_aa,"t1358","調布",92147,"2006-8-15")
dict_aa=dict_append_proc(dict_aa,"t1359","町田",86523,"2006-10-21")


end
# ---------------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa=prepare_data_proc()
#
json_str = JSON.pretty_generate(dict_aa)
#
url_target='http://cddn007:3004/city/tokyo.json'
RestClient.put url_target, json_str
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
