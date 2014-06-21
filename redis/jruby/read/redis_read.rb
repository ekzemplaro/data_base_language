#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	redis_read.rb
#					Apr/18/2013
#
# -------------------------------------------------------------
require 'rubygems'
require 'socket'
require 'json'

# -------------------------------------------------------------
def redis_keys_fetch_proc (ss)
	command = "keys *\r\n"
#	puts command
	ss.puts command
	rec_0 = ss.gets
#	puts rec_0
	nn = rec_0[1..-1].to_i
#	puts nn
	keys = Array.new()
	for it in 0..nn-1
		rec_0 = ss.gets
		rec_1 = ss.gets
		keys << rec_1.chomp
	end
	
	return keys
end
# -------------------------------------------------------------
puts "*** 開始 ***"

HOST = 'host_dbase'
PORT = 6379
#
ss = TCPSocket::open(HOST,PORT)
            

keys = redis_keys_fetch_proc(ss)

keys.each {|key|
	command = "get " + key + "\r\n"
#	puts command
	ss.puts command
	rec_0 = ss.gets
	if (rec_0[0 .. 2] != "$-1") then
		str_json = ss.gets
#		puts str_json
		unit_aa = JSON.parse(str_json)
		print key,"\t"
		print unit_aa['name'],"\t"
		print unit_aa['population'],"\t"
		print unit_aa['date_mod'],"\n"
	end

	} 

puts "*** 終了 ***"

# -------------------------------------------------------------
