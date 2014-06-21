#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mcached_delete.rb
#					Apr/15/2013
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
HOST = 'localhost'
PORT = 11211
ss = TCPSocket::open(HOST,PORT)
#
command = "delete " + key_in + "\n"
ss.puts(command)
rec_0 = ss.gets
puts rec_0
#
ss.close
#
puts "*** 終了 ***"
# --------------------------------------------------------
