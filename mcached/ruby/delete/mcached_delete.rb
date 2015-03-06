#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_delete.rb
#
#						Feb/26/2015
#
require 'dalli'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
key_in = ARGV[0]
#
puts key_in
#
dc = Dalli::Client.new('localhost:11211')
#
dc.delete(key_in)
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

