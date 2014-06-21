#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_read.rb
#					Mar/22/2012
#
require 'memcache'
require	'json'
#
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# -------------------------------------------------------------------
puts "*** 開始 ***"
#
cache = MemCache.new 'localhost:11211'
#cache = MemCache.new 'cdbd026:11211'
#
keys=["t1731","t1732","t1733","t1734",
	"t1735","t1736","t1737","t1738","t1739"]
#
keys.each {|key|
	display_record_proc(cache,key)
	}
#
puts "*** 終了 ***"
# ------------------------------------------------------------
