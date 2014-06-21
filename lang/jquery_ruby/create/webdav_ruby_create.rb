#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	webdav_ruby_create.rb
#
#					Mar/18/2013
# -------------------------------------------------------------
require 'json'
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/net_manipulate.rb'
# -------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa = dict_append_proc(dict_aa,"t1351","八王子",85700,"2006-9-5")
dict_aa = dict_append_proc(dict_aa,"t1352","立川",71600,"2006-2-17")
dict_aa = dict_append_proc(dict_aa,"t1353","武蔵野",49200,"2006-6-8")
dict_aa = dict_append_proc(dict_aa,"t1354","三鷹",72600,"2006-1-22")
dict_aa = dict_append_proc(dict_aa,"t1355","青梅",41500,"2006-5-11")
dict_aa = dict_append_proc(dict_aa,"t1356","府中",15300,"2006-4-17")
dict_aa = dict_append_proc(dict_aa,"t1357","昭島",36800,"2006-4-18")
dict_aa = dict_append_proc(dict_aa,"t1358","調布",71400,"2006-8-15")
dict_aa = dict_append_proc(dict_aa,"t1359","町田",79500,"2006-10-11")

return dict_aa
end
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
dict_aa=prepare_data_proc()
#
json_str = JSON.pretty_generate(dict_aa)
#
url_host='http://cddn007:3004'
url_target = url_host + '/city/tokyo.json'
#
RestClient.put url_target, json_str
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
