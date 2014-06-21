#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#	mcached_ruby_read.rb
#
#					Jun/13/2011
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
#
#
cache = MemCache.new 'localhost:11211'
#
keys=["t1731","t1732","t1733","t1734",
	"t1735","t1736","t1737","t1738","t1739"]
json_str = mcache_to_json_proc(cache,keys)
#
puts "Content-type: text/json\n\n"
puts json_str
#
#
#
