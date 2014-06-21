#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	redis_delete.rb
#					Apr/18/2013
#
# --------------------------------------------------------
require 'socket'
#
# --------------------------------------------------------
puts "*** 開始 ***"
#
key_in = ARGV[0]
puts key_in
#
HOST = 'host_dbase'
PORT = 6379
ss = TCPSocket::open(HOST,PORT)
#
command = "del " + key_in + "\r\n"
ss.puts(command)
rec_0 = ss.gets
puts rec_0
#
ss.close
#
puts "*** 終了 ***"
