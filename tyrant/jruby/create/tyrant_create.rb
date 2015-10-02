#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	tyrant_create.rb
#
#						Sep/14/2015
#
require 'rubygems'
require 'socket'
require 'json'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/mcached_manipulate.rb'
# ------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t4761","那覇",67514,"2007-8-6")
	dict_aa=dict_append_proc(dict_aa,"t4762","宜野湾",32479,"2007-1-12")
	dict_aa=dict_append_proc(dict_aa,"t4763","石垣",54672,"2007-5-29")
	dict_aa=dict_append_proc(dict_aa,"t4764","浦添",41965,"2007-9-21")
	dict_aa=dict_append_proc(dict_aa,"t4765","名護",84137,"2007-10-24")
	dict_aa=dict_append_proc(dict_aa,"t4766","糸満",21589,"2007-4-17")
	dict_aa=dict_append_proc(dict_aa,"t4767","沖縄",42693,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t4768","豊見城",34892,"2007-7-25")
	dict_aa=dict_append_proc(dict_aa,"t4769","うるま",75126,"2007-5-17")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa = prepare_data_proc()
#
#
HOST = 'host_ubuntu'
PORT = 1978
#
ss = TCPSocket::open(HOST,PORT)
#
#
dict_aa.each {|key, value|
	json_str=JSON(value)
	puts json_str
	mcache_set_proc(ss,key,json_str)
}
#
ss.close
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

