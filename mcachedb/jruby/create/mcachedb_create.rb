#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mcachedb_create.rb
#
#						Aug/20/2013
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
	dict_aa=dict_append_proc(dict_aa,"t1521","新潟",35124,"2007-8-6")
	dict_aa=dict_append_proc(dict_aa,"t1522","長岡",27819,"2007-5-27")
	dict_aa=dict_append_proc(dict_aa,"t1523","新発田",45872,"2007-6-19")
	dict_aa=dict_append_proc(dict_aa,"t1524","上越",17925,"2007-7-2")
	dict_aa=dict_append_proc(dict_aa,"t1525","糸魚川",84137,"2007-10-14")
	dict_aa=dict_append_proc(dict_aa,"t1526","加茂",21589,"2007-4-18")
	dict_aa=dict_append_proc(dict_aa,"t1527","三条",42693,"2007-2-8")
	dict_aa=dict_append_proc(dict_aa,"t1528","佐渡",54197,"2007-7-25")
	dict_aa=dict_append_proc(dict_aa,"t1529","柏崎",14926,"2007-5-17")
	dict_aa=dict_append_proc(dict_aa,"t1530","村上",62895,"2007-9-8")
	dict_aa=dict_append_proc(dict_aa,"t1531","十日町",95274,"2007-2-5")
	dict_aa=dict_append_proc(dict_aa,"t1532","五泉",61932,"2007-10-12")
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
PORT = 21201
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

