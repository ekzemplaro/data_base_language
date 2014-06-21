#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	berkeley_read.rb
#
#					Mar/07/2014
#    
require 'bdb'
require	'json'
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
# --------------------------------------------------------------------
puts "*** 開始 ***"
db_file = ARGV[0]
ee = BDB::Btree::open(db_file,"table1","r",0777)
#
ww=ee.to_hash
ee.close()
#
kvalue_display_proc (ww)

print "ww.size =",ww.size,"\n"
puts "*** 終了 ***"
