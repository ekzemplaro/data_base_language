#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mcached_create.rb
#
#						Jun/01/2015
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
	dict_aa=dict_append_proc(dict_aa,"t1731","金沢",87624,"2007-3-26")
	dict_aa=dict_append_proc(dict_aa,"t1732","輪島",52819,"2007-2-17")
	dict_aa=dict_append_proc(dict_aa,"t1733","小松",94572,"2007-8-9")
	dict_aa=dict_append_proc(dict_aa,"t1734","七尾",21365,"2007-1-21")
	dict_aa=dict_append_proc(dict_aa,"t1735","珠洲",84137,"2007-5-24")
	dict_aa=dict_append_proc(dict_aa,"t1736","加賀",21589,"2007-4-17")
	dict_aa=dict_append_proc(dict_aa,"t1737","羽咋",42693,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t1738","かほく",54197,"2007-7-25")
	dict_aa=dict_append_proc(dict_aa,"t1739","白山",14926,"2007-5-17")
#
	return	dict_aa
end
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa = prepare_data_proc()
#
#
HOST = 'localhost'
PORT = 11211
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

