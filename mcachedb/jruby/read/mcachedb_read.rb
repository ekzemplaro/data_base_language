#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	mcachedb_read.rb
#					Sep/14/2015
#
# --------------------------------------------------------
require 'rubygems'
require 'socket'
require 'json'
#
load '/var/www/data_base/common/jruby_common/mcached_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"

HOST = 'host_ubuntu'
PORT = 21201

ss = TCPSocket::open(HOST,PORT)

	keys = ["t1521","t1522","t1523","t1524","t1525","t1526",
			"t1527","t1528","t1529",
			"t1530","t1531","t1532"]

	keys.each {|key|
		mcached_read_proc(ss,key)
		}

ss.close()

puts "*** 終了 ***"

# --------------------------------------------------------
