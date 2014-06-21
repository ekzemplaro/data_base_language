#!/usr/bin/ruby1.8
# -*- coding: utf-8 -*-
#
#	berkeley_update.rb
#
#					Mar/21/2013
#    
require 'bdb'
require	'json'
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
# --------------------------------------------------------------------
puts "*** 開始 ***"
db_file = ARGV[0]
id_in = ARGV[1]
population_in = ARGV[2].to_i

puts id_in,population_in
#
puts "*** ppp ***"
#ee = BDB::Btree::open(db_file,"table1","w",0777)
ee = BDB::Btree::open(db_file,"table1","r+",0777)
puts "*** qqq ***"
#
kvalue_update_proc(ee,id_in,population_in)
#
ww=ee.to_hash
kvalue_display_proc(ww)
ee.close()
#

print "ww.size =",ww.size,"\n"
puts "*** 終了 ***"
