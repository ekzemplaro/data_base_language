#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcachedb_delete.rb
#
#						Mar/22/2012
#
require 'memcache'
require 'json'
#
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
#
# ------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
#
puts id_in
#
cache = MemCache.new 'localhost:21201'
#
#
cache.delete(id_in)
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

