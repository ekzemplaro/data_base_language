#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	riak_create.rb
#
#					Aug/20/2013
#
require 'rubygems'
require 'json'
require 'net/http'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/couch_module.rb'
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
	dict_aa={}

	dict_aa=dict_append_proc(dict_aa,"t3251","松江",52614,"2007-10-5")
	dict_aa=dict_append_proc(dict_aa,"t3252","出雲",21357,"2007-2-27")
	dict_aa=dict_append_proc(dict_aa,"t3253","大田",47195,"2007-8-18")
	dict_aa=dict_append_proc(dict_aa,"t3254","雲南",75628,"2007-1-22")
	dict_aa=dict_append_proc(dict_aa,"t3255","江津",41389,"2007-5-11")
	dict_aa=dict_append_proc(dict_aa,"t3256","浜田",16925,"2007-9-17")
	dict_aa=dict_append_proc(dict_aa,"t3257","益田",36942,"2007-4-12")
	dict_aa=dict_append_proc(dict_aa,"t3258","安来",71428,"2007-6-15")

	return dict_aa
end
# ---------------------------------------------------------------------
#
puts "*** 開始 ***"
#
server = Couch::Server.new("localhost","8098")
#
dict_aa=prepare_data_proc()
#
dict_aa.each {|key,value|
	json_str=JSON(value)
	target = "/riak/shimane/" + key
	server.put(target,json_str)
	}
#
puts	"*** 終了 ***"
#
# --------------------------------------------------------------------------
