#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	tcbn_read.rb
#
#					Mar/22/2013
# -----------------------------------------------------------------
require 'tokyocabinet'
include TokyoCabinet
require 'json'
#
load '/var/www/data_base/common/ruby_common/tcbn_manipulate.rb'
load '/var/www/data_base/common/ruby_common/kvalue_manipulate.rb'
#
# -----------------------------------------------------------------
puts	"*** 開始 ***"
#
bdb = BDB::new
#
if !bdb.open("/var/tmp/tokyo_cabinet/cities.tcb", BDB::OWRITER | BDB::OCREAT)
	ecode = bdb.ecode
	STDERR.printf("open error: %s\n", bdb.errmsg(ecode))
end
#
#bdb.each do |key,value|
#	printf("%s:%s\n", key, value)
#	end
#
tcbn_display_proc(bdb)
#
if !bdb.close
	ecode = bdb.ecode
	STDERR.printf("close error: %s\n", bdb.errmsg(ecode))
end
#
puts	"*** 終了 ***"
# -----------------------------------------------------------------
