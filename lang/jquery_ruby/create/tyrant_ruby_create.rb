#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	tyrant_ruby_create.rb
#
#					Jun/25/2012
# -------------------------------------------------------------
require 'memcache'
require 'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
cache = MemCache.new 'localhost:1978'
#
cache["t4761"] = json_gen_proc("那覇",54300,"2006-11-9")
cache["t4762"] = json_gen_proc("宜野湾",95200,"2006-10-15")
cache["t4763"] = json_gen_proc("石垣",74300,"2006-8-1")
cache["t4764"] = json_gen_proc("浦添",82400,"2006-3-3")
cache["t4765"] = json_gen_proc("名護",49700,"2006-5-9")
cache["t4766"] = json_gen_proc("糸満",25100,"2006-1-18")
cache["t4767"] = json_gen_proc("沖縄",34600,"2006-6-21")
cache["t4768"] = json_gen_proc("豊見城",42300,"2006-3-15")
cache["t4769"] = json_gen_proc("うるま",54700,"2006-5-2")
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
