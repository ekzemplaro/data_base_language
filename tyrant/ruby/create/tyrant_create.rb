#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	tyrant_create.rb
#
#						Mar/22/2012
#
require 'memcache'
require 'json'
#
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
# ------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t4761","那覇",45726,"2006-2-25")
	dict_aa=dict_append_proc(dict_aa,"t4762","宜野湾",29819,"2006-7-27")
	dict_aa=dict_append_proc(dict_aa,"t4763","石垣",51872,"2006-2-8")
	dict_aa=dict_append_proc(dict_aa,"t4764","浦添",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t4765","名護",87142,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t4766","糸満",21583,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t4767","沖縄",42697,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t4768","豊見城",52187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t4769","うるま",74326,"2006-10-27")
#
	return	dict_aa
end
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
cache = MemCache.new 'localhost:1978'
#cache = MemCache.new 'cdbd026:1978'
#
dict_aa = data_prepare_proc()
#
dict_aa.each {|key, value|
		name = value['name']
		population = value['population']
		date_mod = value['date_mod']
		cache[key] = json_gen_proc(name,population,date_mod)
		}
#
keys=["t4761","t4762","t4763","t4764",
	"t4765","t4766","t4767","t4768","t4769"]
keys.each {|key|
	display_record_proc(cache,key)
	}
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

