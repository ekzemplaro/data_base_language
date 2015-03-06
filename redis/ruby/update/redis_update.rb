#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	redis_update.rb
#					May/22/2013
#
require 'redis'
#require 'json'
#
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# -------------------------------------------------------------------
puts "*** 開始 ***"
#
key_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts key_in
puts population_in
#
redis = Redis.new(:host => "host_dbase", :port => 6379)
#
redis_update_proc(redis,key_in,population_in)
#
redis_display_proc(redis)
#
puts "*** 終了 ***"
# -------------------------------------------------------------------
