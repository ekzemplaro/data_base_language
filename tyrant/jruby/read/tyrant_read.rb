#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	tyrant_read.rb
#					Sep/14/2015
#
# --------------------------------------------------------
# Echo client program
require 'rubygems'
require 'socket'
require 'json'

load '/var/www/data_base/common/jruby_common/mcached_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"
HOST = 'host_ubuntu'
PORT = 1978
#
ss = TCPSocket::open(HOST,PORT)
#
keys = ["t4761","t4762","t4763","t4764","t4765","t4766",
			"t4767","t4768","t4769"]
#
keys.each {|key|
	mcached_read_proc(ss,key)
	}
#
ss.close
#
puts "*** 終了 ***"
# --------------------------------------------------------
