#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	couch_create.rb
#
#					Jun/20/2014
#
require 'json'
require 'restclient'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
#
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}

dict_aa=dict_append_proc(dict_aa,'t2021',"長野",71843,"2006-4-19")
dict_aa=dict_append_proc(dict_aa,'t2022',"松本",23789,"2006-7-27")
dict_aa=dict_append_proc(dict_aa,'t2023',"上田",47251,"2006-2-8")
dict_aa=dict_append_proc(dict_aa,'t2024',"小諸",78623,"2006-1-22")
dict_aa=dict_append_proc(dict_aa,'t2025',"岡谷",91489,"2006-5-11")
dict_aa=dict_append_proc(dict_aa,'t2026',"塩尻",27915,"2006-4-17")
dict_aa=dict_append_proc(dict_aa,'t2027',"茅野",36972,"2006-9-18")
dict_aa=dict_append_proc(dict_aa,'t2028',"飯田",74921,"2006-8-15")
dict_aa=dict_append_proc(dict_aa,'t2029',"中野",81923,"2006-10-11")
dict_aa=dict_append_proc(dict_aa,'t2030',"諏訪",47598,"2006-9-12")
dict_aa=dict_append_proc(dict_aa,'t2031',"駒ヶ根",51738,"2006-7-22")
dict_aa=dict_append_proc(dict_aa,'t2032',"佐久",82514,"2006-8-17")
dict_aa=dict_append_proc(dict_aa,'t2033',"伊那",74361,"2006-12-29")
dict_aa=dict_append_proc(dict_aa,'t2034',"千曲",15672,"2006-11-21")

end
# ---------------------------------------------------------------------
#
puts "*** 開始 ***"
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
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
