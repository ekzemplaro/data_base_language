#!/usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	berkeley_delete.rb
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
id_in = ARGV[1]

puts id_in
#
ee = BDB::Btree::open(db_file,"table1","r+",0777)
kvalue_delete_proc(ee,id_in)
ee.close()
#
puts "*** 終了 ***"
