#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	tcbn_ruby_read.rb
#
#					Oct/07/2010
# -------------------------------------------------------------
#
load '/var/www/data_base/common/ruby_common/tcbn_manipulate.rb'
#
#
bdb = BDB::new
file_in="/var/tmp/tokyo_cabinet/cities.tcb"
if !bdb.open(file_in, BDB::OWRITER | BDB::OCREAT)
	ecode = bdb.ecode
	STDERR.printf("open error: %s\n", bdb.errmsg(ecode))
end
#
json_str = tcbn_to_json_proc(bdb)
#
if !bdb.close
	ecode = bdb.ecode
	STDERR.printf("close error: %s\n", bdb.errmsg(ecode))
end
#
puts "Content-type: text/json\n\n"
puts json_str
#
#
# -------------------------------------------------------------
