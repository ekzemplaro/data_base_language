#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	mcachedb_ruby_read.rb
#
#					Jun/13/2010
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
#
#
cache = MemCache.new 'localhost:21201'
#
keys=["t1521","t1522","t1523","t1524",
	"t1525","t1526","t1527","t1528",
	"t1529","t1530","t1531","t1532"]
json_str = mcache_to_json_proc(cache,keys)
#
puts "Content-type: text/json\n\n"
puts json_str
#
#
#
