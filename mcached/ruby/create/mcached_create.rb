#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcached_create.rb
#
#						Feb/26/2015
#
require 'dalli'
require 'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dc = Dalli::Client.new('localhost:11211')
#
#
dc.set("t1731",json_gen_proc("金沢",21384,"2006-10-27"))
dc.set("t1732",json_gen_proc("輪島",34576,"2006-4-21"))
dc.set("t1733",json_gen_proc("小松",64158,"2006-3-14"))
dc.set("t1734",json_gen_proc("七尾",86531,"2006-11-3"))
dc.set("t1735",json_gen_proc("珠洲",49725,"2006-8-9"))
dc.set("t1736",json_gen_proc("加賀",25134,"2006-7-18"))
dc.set("t1737",json_gen_proc("羽咋",34678,"2006-6-21"))
dc.set("t1738",json_gen_proc("かほく",45172,"2006-3-14"))
dc.set("t1739",json_gen_proc("白山",98651,"2006-5-2"))
#
puts "*** 終了 ***"
# ------------------------------------------------------------

