#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	ruby/update/tcbn_update.rb
#
#					Mar/22/2013
#
# -------------------------------------------------------------
require 'date'
require 'tokyocabinet'
include TokyoCabinet
require 'json'
#
load '/var/www/data_base/common/ruby_common/tcbn_manipulate.rb'
#
# -------------------------------------------------------------
puts	"*** 開始 ***"
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
bdb = BDB::new
#
file_in="/var/tmp/tokyo_cabinet/cities.tcb"
if !bdb.open(file_in, BDB::OWRITER | BDB::OCREAT)
	ecode = bdb.ecode
	STDERR.printf("open error: %s\n", bdb.errmsg(ecode))
end
#
tcbn_update_proc(bdb,id_in,population_in)
#
tcbn_display_proc(bdb)
#
# close the database
if !bdb.close
	ecode = bdb.ecode
	STDERR.printf("close error: %s\n", bdb.errmsg(ecode))
end
#
puts "*** 終了 ***"
# -------------------------------------------------------------
