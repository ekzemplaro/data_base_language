#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcachedb_update.rb
#
#						Mar/22/2012
#
require 'memcache'
require 'json'
require 'date'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
cache = MemCache.new 'localhost:21201'
#
mcache_update_proc(cache,id_in,population_in)
#
keys=["t1521","t1522","t1523","t1524",
	"t1525","t1526","t1527","t1528",
	"t1529","t1530","t1531","t1532"]
keys.each {|key|
	display_record_proc(cache,key)
	}
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

