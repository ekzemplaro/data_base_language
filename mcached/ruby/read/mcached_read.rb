#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_read.rb
#					Feb/26/2015
#
require 'dalli'
require	'json'
#
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# -------------------------------------------------------------------
puts "*** 開始 ***"
#
dc = Dalli::Client.new('localhost:11211')
#
keys=["t1731","t1732","t1733","t1734",
	"t1735","t1736","t1737","t1738","t1739"]
#
keys.each {|key|
	display_record_proc(dc,key)
	}
#
puts "*** 終了 ***"
# ------------------------------------------------------------
