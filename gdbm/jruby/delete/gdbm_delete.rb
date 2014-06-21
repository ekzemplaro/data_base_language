#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	delete/gdbm_delete.rb
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
#
puts id_in
#
ee=DBM.open("/var/tmp/gdbm/cities")
#
kvalue_delete_proc(ee,id_in)
#
ww=ee.to_hash;
kvalue_display_proc(ww)
ee.close
#
print "ww.size =",ww.size,"\n"
#
puts "*** 終了 ***"
#
