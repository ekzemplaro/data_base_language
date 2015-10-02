#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	tyrant_update.rb
#					Apr/15/2013
#
# --------------------------------------------------------
require 'rubygems'
require 'socket'
require 'json'
require 'date'
# --------------------------------------------------------
load '/var/www/data_base/common/jruby_common/mcached_manipulate.rb'
# --------------------------------------------------------
puts "*** 開始 ***"

key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
HOST = 'host_ubuntu'
PORT = 1978
#
ss = TCPSocket::open(HOST,PORT)
#
mcached_update_proc(ss,key_in,population_in)
#
ss.close()
#
puts "*** 終了 ***"

# --------------------------------------------------------
