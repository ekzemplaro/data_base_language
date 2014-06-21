#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	read/gdbm_read.rb
#
#				Aug/26/2013
#
# --------------------------------------------------------------------
require	'dbm'
require	'json'
#
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
# --------------------------------------------------------------------
puts	"*** 開始 ***"
#
file_gdbm=ARGV[0]
ee=DBM.open(file_gdbm)
ww=ee.to_hash;
ee.close
#
kvalue_display_proc (ww)
#
print "ww.size =",ww.size,"\n"
#
puts "*** 終了 ***"
#
# --------------------------------------------------------------------
