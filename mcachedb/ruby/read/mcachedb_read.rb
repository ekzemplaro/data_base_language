#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcachedb_read.rb
#					Feb/27/2015
#
require 'dalli'
require	'json'
#
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# -------------------------------------------------------------------
puts "*** 開始 ***"
#
# dc = Dalli::Client.new('host_ubuntu:21201')
dc = Dalli::Client.new('cddn007-ee:21201')
#
keys=["t1521","t1522","t1523","t1524",
	"t1525","t1526","t1527","t1528",
	"t1529","t1530","t1531","t1532"]
keys.each {|key|
	puts key
	value=dc.get(key)
	puts value
#	display_record_proc(dc,key)
	}
#
puts "*** 終了 ***"
# ------------------------------------------------------------
