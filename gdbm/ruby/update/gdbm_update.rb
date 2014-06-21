#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	update/gdbm_update.rb
#
#				Aug/26/2013
#
# --------------------------------------------------------------------
require	'dbm'
require	'date'
require	'json'
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
# --------------------------------------------------------------------
puts	"*** 開始 ***"
#
file_gdbm = ARGV[0]
key_in = ARGV[1]
population_in = ARGV[2].to_i
#
puts key_in,population_in
#
ee=DBM.open(file_gdbm)
#
kvalue_update_proc(ee,key_in,population_in)
#
ww=ee.to_hash;
kvalue_display_proc(ww)
ee.close
#
print "ww.size =",ww.size,"\n"
#
puts "*** 終了 ***"
#
# --------------------------------------------------------------------
