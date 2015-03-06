#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_update.rb
#
#						Feb/26/2015
#
require 'dalli'
require 'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in,population_in
#
dc = Dalli::Client.new('localhost:11211')
#
mcache_update_proc(dc,key_in,population_in)
#
puts "*** 終了 ***"
# ------------------------------------------------------------

