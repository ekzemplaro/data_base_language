#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	redis_create.rb
#					May/22/2013
#
require 'rubygems'
require 'redis'
require 'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# -------------------------------------------------------------------
#
puts "*** 開始 ***"
#
#redis = Redis.new
redis = Redis.new(:host => "host_dbase", :port => 6379)
redis.flushdb
#
redis.set 't1851',json_gen_proc("福井",24713,"2006-2-15")
redis.set 't1852',json_gen_proc("敦賀",48352,"2006-6-9")
redis.set 't1853',json_gen_proc("小浜",19326,"2006-3-20")
redis.set 't1854',json_gen_proc("大野",85397,"2006-2-8")
redis.set 't1855',json_gen_proc("勝山",17346,"2006-5-12")
redis.set 't1856',json_gen_proc("鯖江",51729,"2006-1-14")
redis.set 't1857',json_gen_proc("あわら",76591,"2006-9-22")
redis.set 't1858',json_gen_proc("越前",94512,"2006-8-28")
redis.set 't1859',json_gen_proc("坂井",41878,"2006-10-20")
#
puts "*** ppp ***"
redis_display_proc(redis)
#
puts "*** 終了 ***"
# -------------------------------------------------------------------
