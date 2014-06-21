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
# --------------------------------------------------------
puts "*** 開始 ***"
#
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
HOST = 'host_dbase'
PORT = 6379
ss = TCPSocket::open(HOST,PORT)
#
command = "get " + key_in + "\r\n"
ss.puts(command)
rec_0 = ss.gets
puts rec_0
if (rec_0[0 .. 2] != "$-1") then
	json_str = ss.gets
	puts json_str
	unit_aa = JSON.parse(json_str)
	unit_aa['population'] = population_in
	unit_aa['date_mod'] = Date.today
	json_str_new=JSON(unit_aa)
	print json_str_new
	command = "set " + key_in + " " + json_str_new +  "\r\n"
	ss.puts(command)
	rec_0 = ss.gets
end
#
ss.close
#
puts "*** 終了 ***"
