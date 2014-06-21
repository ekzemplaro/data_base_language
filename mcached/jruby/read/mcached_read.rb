#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mcached_read.rb
#					Apr/15/2013
#
# --------------------------------------------------------
# Echo client program
require 'rubygems'
require 'socket'
require 'json'

load '/var/www/data_base/common/jruby_common/mcached_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
HOST = 'localhost'
PORT = 11211
#
ss = TCPSocket::open(HOST,PORT)
#
keys = ["t1731","t1732","t1733","t1734","t1735","t1736",
			"t1737","t1738","t1739"]
#
keys.each {|key|
	mcached_read_proc(ss,key)
	}
#
ss.close
#
puts "*** 終了 ***"
# --------------------------------------------------------
