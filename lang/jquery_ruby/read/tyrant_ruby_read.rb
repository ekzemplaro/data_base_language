#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#	tyrant_ruby_read.rb
#
#					Jul/11/2011
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
#
#
cache = MemCache.new 'localhost:1978'
#
keys=["t4761","t4762","t4763","t4764",
	"t4765","t4766","t4767","t4768","t4769"]
json_str = mcache_to_json_proc(cache,keys)
#
puts "Content-type: text/json\n\n"
puts json_str
#
#
#
