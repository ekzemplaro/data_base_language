#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	mcachedb_create.rb
#
#						Jul/08/2015
#
require 'dalli'
require 'json'
#
load '/var/www/data_base/common/ruby_common/json_manipulate.rb'
load '/var/www/data_base/common/ruby_common/mcache_manipulate.rb'
# ------------------------------------------------------------
puts "*** 開始 ***"
#
dc = Dalli::Client.new('ubuntu_1504:21201')
#
#
cache["t1521"] = json_gen_proc("新潟",98271,"2006-4-27")
cache["t1522"] = json_gen_proc("長岡",74865,"2006-1-3")
cache["t1523"] = json_gen_proc("新発田",25617,"2006-3-14")
cache["t1524"] = json_gen_proc("上越",84521,"2006-9-3")
cache["t1525"] = json_gen_proc("糸魚川",47189,"2006-8-9")
cache["t1526"] = json_gen_proc("加茂",25164,"2006-7-18")
cache["t1527"] = json_gen_proc("三条",34695,"2006-6-21")
cache["t1528"] = json_gen_proc("佐渡",42735,"2006-3-14")
cache["t1529"] = json_gen_proc("柏崎",54628,"2006-5-22")
cache["t1530"] = json_gen_proc("村上",71385,"2006-9-17")
cache["t1531"] = json_gen_proc("十日町",85312,"2006-8-26")
cache["t1532"] = json_gen_proc("五泉",76348,"2006-7-18")
#
#
puts "*** 終了 ***"
# ------------------------------------------------------------

