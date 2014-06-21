#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	redis_read.rb
#
#					May/22/2013
#
#
require 'rubygems'
require 'redis'
#
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
puts "*** 開始 ***"
#
redis = Redis.new(:host => "host_dbase", :port => 6379)

redis_display_proc (redis)

puts "*** 終了 ***"

# ---------------------------------------------------------------------
