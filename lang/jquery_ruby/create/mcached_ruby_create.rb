#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	mcached_ruby_create.rb
#
#					Mar/22/2012
# -------------------------------------------------------------
require 'memcache'
require 'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
cache = MemCache.new 'localhost:11211'
#
cache["t1731"] = json_gen_proc("金沢",17100,"2006-10-9")
cache["t1732"] = json_gen_proc("輪島",95400,"2006-11-15")
cache["t1733"] = json_gen_proc("小松",74300,"2006-12-1")
cache["t1734"] = json_gen_proc("七尾",82500,"2006-3-3")
cache["t1735"] = json_gen_proc("珠洲",49600,"2006-5-9")
cache["t1736"] = json_gen_proc("加賀",25100,"2006-1-18")
cache["t1737"] = json_gen_proc("羽咋",34600,"2006-6-21")
cache["t1738"] = json_gen_proc("かほく",42300,"2006-3-15")
cache["t1739"] = json_gen_proc("白山",54700,"2006-5-2")
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
