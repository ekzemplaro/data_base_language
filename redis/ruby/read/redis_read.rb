#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	redis_read.rb
#
#					Feb/26/2015
#
# ---------------------------------------------------------------------
require 'redis'
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/ruby_common/redis_manipulate.rb'
# ---------------------------------------------------------------------
puts "*** 開始 ***"
#
dict_aa = redis_to_dict_proc("host_dbase")

dict_display_proc(dict_aa)

puts "*** 終了 ***"
# ---------------------------------------------------------------------
