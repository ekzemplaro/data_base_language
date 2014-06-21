#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	tyrant_delete.rb
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
cache = MemCache.new 'localhost:1978'
#cache = MemCache.new 'cdbd026:1978'
#
cache.delete(id_in)
#
keys=["t4761","t4762","t4763","t4764",
	"t4765","t4766","t4767","t4768","t4769"]
keys.each {|key|
	display_record_proc(cache,key)
	}
#
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

