#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	tyrant_read.rb
#					Jul/09/2015
#
require 'dalli'
require	'json'
#
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# -------------------------------------------------------------------
puts "*** 開始 ***"
#
dc = Dalli::Client.new('host_ubuntu:1978')
#
keys=["t4761","t4762","t4763","t4764",
	"t4765","t4766","t4767","t4768","t4769"]
#
keys.each {|key|
	display_record_proc(dc,key)
	}
#
puts "*** 終了 ***"
# ------------------------------------------------------------
