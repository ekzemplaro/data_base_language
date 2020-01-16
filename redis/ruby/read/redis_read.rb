#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	redis_read.rb
#
#					Jan/16/2020
#
# ---------------------------------------------------------------------
require 'redis'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# ---------------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa = redis_to_dict_proc("localhost")

dict_display_proc(dict_aa)

puts "*** 終了 ***"
# ---------------------------------------------------------------------
