#! /usr/bin/jruby
#
#	read/gdbm_read.rb
#
#				Sep/17/2010
#
require	'dbm'
require	'json'
#
load '/var/www/uchida/data_base/common/ruby_common/kvalue_manipulate.rb'
# --------------------------------------------------------------------
puts	"*** 開始 ***"
#
ee=DBM.open("/var/tmp/gdbm/cities")
ww=ee.to_hash;
ee.close
#
kvalue_display_proc (ww)
#
print "ww.size =",ww.size,"\n"
#
puts "*** 終了 ***"
#
