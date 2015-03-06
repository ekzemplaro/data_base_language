#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	redis_delete.rb
#					Feb/25/2015
#
#require 'rubygems'
require 'redis'
#
# load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# -------------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
#
puts id_in
#
redis = Redis.new(:host => "host_dbase", :port => 6379)
#
redis.del id_in
#
puts "*** 終了 ***"
# -------------------------------------------------------------------
