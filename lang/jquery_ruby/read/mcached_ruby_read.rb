#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#	mcached_ruby_read.rb
#
#					Feb/26/2015
# -------------------------------------------------------------
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
#
#
dc = Dalli::Client.new('localhost:11211')
#
keys=["t1731","t1732","t1733","t1734",
	"t1735","t1736","t1737","t1738","t1739"]
json_str = mcache_to_json_proc(dc,keys)
#
puts "Content-type: text/json\n\n"
puts json_str
#
#
#
