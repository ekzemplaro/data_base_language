#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	update/gdbm_update.rb
#
#				Aug/18/2010
#
require	'dbm'
require	'date'
require	'json'
#
load '/var/www/uchida/data_base/common/ruby_common/kvalue_manipulate.rb'
# --------------------------------------------------------------------
puts	"*** 開始 ***"
#
id_in = ARGV[0].to_i
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
ee=DBM.open("/var/tmp/gdbm/cities")
#
kvalue_update_proc(ee,id_in,population_in)
#
ww=ee.to_hash;
kvalue_display_proc(ww)
ee.close
#
print "ww.size =",ww.size,"\n"
#
puts "*** 終了 ***"
#
