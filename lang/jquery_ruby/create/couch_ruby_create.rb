#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	couch_ruby_create.rb
#
#					Jun/20/2014
# -------------------------------------------------------------
require 'json'
require	'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
#
# -------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa = dict_append_proc(dict_aa,"t2021","長野",52300,"2006-5-9")
dict_aa = dict_append_proc(dict_aa,"t2022","松本",31700,"2006-3-17")
dict_aa = dict_append_proc(dict_aa,"t2023","上田",47200,"2006-2-8")
dict_aa = dict_append_proc(dict_aa,"t2024","小諸",71600,"2006-1-22")
dict_aa = dict_append_proc(dict_aa,"t2025","岡谷",49200,"2006-5-11")
dict_aa = dict_append_proc(dict_aa,"t2026","塩尻",15900,"2006-4-17")
dict_aa = dict_append_proc(dict_aa,"t2027","茅野",36900,"2006-4-18")
dict_aa = dict_append_proc(dict_aa,"t2028","飯田",78400,"2006-8-15")
dict_aa = dict_append_proc(dict_aa,"t2029","中野",82900,"2006-10-11")
dict_aa = dict_append_proc(dict_aa,"t2030","諏訪",47300,"2006-9-12")
dict_aa = dict_append_proc(dict_aa,"t2031","駒ヶ根",96500,"2006-7-22")
dict_aa = dict_append_proc(dict_aa,"t2032","佐久",87200,"2006-5-27")
dict_aa = dict_append_proc(dict_aa,"t2033","伊那",34700,"2006-7-9")
dict_aa = dict_append_proc(dict_aa,"t2034","千曲",25100,"2006-8-3")

return dict_aa
end
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
url_collection = 'http://localhost:5984/nagano'
RestClient.delete url_collection
RestClient.put url_collection, '{}'
#
dict_aa=prepare_data_proc()
#
dict_aa.each {|key, value|
	puts key
	url_target = url_collection + '/' + key
	json_out = JSON.generate (value)
	RestClient.put url_target, json_out
	}
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
