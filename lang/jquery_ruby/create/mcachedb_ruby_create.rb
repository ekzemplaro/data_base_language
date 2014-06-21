#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	mcachedb_ruby_create.rb
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
cache = MemCache.new 'localhost:21201'
#
cache["t1521"] = json_gen_proc("新潟",24100,"2006-5-17")
cache["t1522"] = json_gen_proc("長岡",34500,"2006-4-23")
cache["t1523"] = json_gen_proc("新発田",73200,"2006-3-14")
cache["t1524"] = json_gen_proc("上越",84500,"2006-9-3")
cache["t1525"] = json_gen_proc("糸魚川",44100,"2006-8-9")
cache["t1526"] = json_gen_proc("加茂",25100,"2006-7-18")
cache["t1527"] = json_gen_proc("三条",34600,"2006-6-21")
cache["t1528"] = json_gen_proc("佐渡",42700,"2006-3-14")
cache["t1529"] = json_gen_proc("柏崎",54600,"2006-5-22")
cache["t1530"] = json_gen_proc("村上",71300,"2006-9-17")
cache["t1531"] = json_gen_proc("十日町",85300,"2006-8-26")
cache["t1532"] = json_gen_proc("五泉",46300,"2006-7-12")
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
