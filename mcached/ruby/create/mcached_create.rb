#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_create.rb
#
#						Jun/13/2013
#
require 'memcache'
require 'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
cache = MemCache.new 'localhost:11211'
#cache = MemCache.new 'cdbd026:11211'
#
#
cache["t1731"] = json_gen_proc("金沢",21384,"2006-10-27")
cache["t1732"] = json_gen_proc("輪島",34576,"2006-4-21")
cache["t1733"] = json_gen_proc("小松",64158,"2006-3-14")
cache["t1734"] = json_gen_proc("七尾",86531,"2006-11-3")
cache["t1735"] = json_gen_proc("珠洲",49725,"2006-8-9")
cache["t1736"] = json_gen_proc("加賀",25134,"2006-7-18")
cache["t1737"] = json_gen_proc("羽咋",34678,"2006-6-21")
cache["t1738"] = json_gen_proc("かほく",45172,"2006-3-14")
cache["t1739"] = json_gen_proc("白山",98651,"2006-5-2")
#
keys=["t1731","t1732","t1733","t1734",
	"t1735","t1736","t1737","t1738","t1739"]
keys.each {|key|
	display_record_proc(cache,key)
	}
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

