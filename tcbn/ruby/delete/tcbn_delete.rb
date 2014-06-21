#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	tcbn_delete.rb
#
#					Mar/22/2013
#
# -------------------------------------------------------------
require 'tokyocabinet'
include TokyoCabinet
require 'json'
#
load '/var/www/data_base/common/ruby_common/tcbn_manipulate.rb'
#
# -------------------------------------------------------------
puts	"*** 開始 ***"
id_in = ARGV[0]
#
puts id_in
#
bdb = BDB::new
#
file_in="/var/tmp/tokyo_cabinet/cities.tcb"
if !bdb.open(file_in, BDB::OWRITER | BDB::OCREAT)
	ecode = bdb.ecode
	STDERR.printf("open error: %s\n", bdb.errmsg(ecode))
end
#
bdb.out(id_in.to_s)
#
tcbn_display_proc(bdb)
#
if !bdb.close
	ecode = bdb.ecode
	STDERR.printf("close error: %s\n", bdb.errmsg(ecode))
end
#
puts "*** 終了 ***"
# -------------------------------------------------------------
