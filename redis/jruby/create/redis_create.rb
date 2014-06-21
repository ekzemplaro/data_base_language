#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	redis_update.rb
#					Apr/18/2013
#
# --------------------------------------------------------
require 'rubygems'
require 'socket'
require 'json'
require 'date'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# --------------------------------------------------------
def data_prepare_proc ()
	dict_aa = {}

	dict_aa = dict_append_proc(dict_aa,"t1851","福井",81325,"1951-3-8")
	dict_aa = dict_append_proc(dict_aa,"t1852","敦賀",79354,"1951-8-9")
	dict_aa = dict_append_proc(dict_aa,"t1853","小浜",64137,"1951-5-12")
	dict_aa = dict_append_proc(dict_aa,"t1854","大野",38724,"1951-7-22")
	dict_aa = dict_append_proc(dict_aa,"t1855","勝山",47152,"1951-12-14")
	dict_aa = dict_append_proc(dict_aa,"t1856","鯖江",68974,"1951-9-12")
	dict_aa = dict_append_proc(dict_aa,"t1857","あわら",37281,"1951-3-21")
	dict_aa = dict_append_proc(dict_aa,"t1858","越前",52416,"1951-7-26")
	dict_aa = dict_append_proc(dict_aa,"t1859","坂井",74851,"1951-10-8")

	return	dict_aa
end

# -------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa = data_prepare_proc()
#
HOST = 'host_dbase'
PORT = 6379
ss = TCPSocket::open(HOST,PORT)
#
dict_aa.each {|key, value|
	json_str=JSON(value)
	command = "set " + key + " " + json_str +  "\r\n"
	ss.puts(command)
	rec_0 = ss.gets
}
#
ss.close
#
puts "*** 終了 ***"

# -------------------------------------------------------------
