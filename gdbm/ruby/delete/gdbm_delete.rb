#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	delete/gdbm_delete.rb
#
#				Aug/26/2013
#
require	'dbm'
require	'json'
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
# --------------------------------------------------------------------
puts	"*** 開始 ***"
#
file_gdbm = ARGV[0]
key_in = ARGV[1]
#
puts key_in
#
ee=DBM.open(file_gdbm)
#
kvalue_delete_proc(ee,key_in)
#
ww=ee.to_hash;
kvalue_display_proc(ww)
ee.close
#
print "ww.size =",ww.size,"\n"
#
puts "*** 終了 ***"
#
