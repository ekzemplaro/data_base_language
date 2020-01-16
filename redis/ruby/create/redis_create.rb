#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	redis_create.rb
#					Jan/16/2020
#
require 'redis'
require 'json'
#
# load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# -------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t1851","福井",73526,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t1852","敦賀",81743,"2006-9-17")
	dict_aa=dict_append_proc(dict_aa,"t1853","小浜",87942,"2006-1-9")
	dict_aa=dict_append_proc(dict_aa,"t1854","大野",91845,"2006-3-25")
	dict_aa=dict_append_proc(dict_aa,"t1855","勝山",16523,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t1856","鯖江",21589,"2006-8-7")
	dict_aa=dict_append_proc(dict_aa,"t1857","あわら",42613,"2006-4-21")
	dict_aa=dict_append_proc(dict_aa,"t1858","越前",58197,"2006-8-12")
	dict_aa=dict_append_proc(dict_aa,"t1859","坂井",74326,"2006-10-28")
#
	return	dict_aa
end
# -------------------------------------------------------------------
#
puts "*** 開始 ***"
#
dict_aa = data_prepare_proc()
#
redis = Redis.new(:host => "localhost", :port => 6379)
redis.flushdb
#
dict_aa.each {|key, value|
	json_str = JSON.generate(value)
	redis.set key,json_str
}
#
puts "*** 終了 ***"
# -------------------------------------------------------------------
