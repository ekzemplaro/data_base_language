#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_update.rb
#
#						Mar/22/2012
#
require 'memcache'
require 'json'
require 'date'
#
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
cache = MemCache.new 'localhost:1978'
#cache = MemCache.new 'cdbd026:1978'
#
mcache_update_proc(cache,id_in,population_in)
#
keys=["t4761","t4762","t4763","t4764",
	"t4765","t4766","t4767","t4768","t4769"]
keys.each {|key|
	display_record_proc(cache,key)
	}
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

