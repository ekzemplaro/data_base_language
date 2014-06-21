#! /usr/bin/ruby1.8
#
#	mongo_create.rb
#
#					Jun/25/2012
#
require 'rubygems'
require 'mongo'
include Mongo
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mongo_manipulate.rb'
#
# -------------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t1161","さいたま",65347,"2006-5-15")
	dict_aa=dict_append_proc(dict_aa,"t1162","所沢",84921,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t1163","越谷",52876,"2006-3-18")
	dict_aa=dict_append_proc(dict_aa,"t1164","久喜",27965,"2006-1-21")
	dict_aa=dict_append_proc(dict_aa,"t1165","熊谷",84142,"2006-5-24")
	dict_aa=dict_append_proc(dict_aa,"t1166","秩父",21589,"2006-4-7")
	dict_aa=dict_append_proc(dict_aa,"t1167","川越",42693,"2006-4-8")
	dict_aa=dict_append_proc(dict_aa,"t1168","和光",54187,"2006-8-15")
	dict_aa=dict_append_proc(dict_aa,"t1169","新座",32156,"2006-11-27")
#
	return	dict_aa
end
# -------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa = data_prepare_proc()
#
dict_to_mongo_proc(dict_aa)
#
puts "*** 終了 ***"
# -------------------------------------------------------------
