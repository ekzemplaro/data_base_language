#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
#
#	tcbn_ruby_create.rb
#
#					Jun/13/2011
# -------------------------------------------------------------
require 'tokyocabinet'
include TokyoCabinet
#
load '/var/www/data_base/common/ruby_common/tcbn_manipulate.rb'
#
# -----------------------------------------------------------------
def data_create_proc (bdb)
	data = {}
data["t0831"] = '{"name":"水戸","population":"71200","date_mod":"2006-2-9"}'
data["t0832"] = '{"name":"古河","population":"23500","date_mod":"2006-1-17"}'
data["t0833"] = '{"name":"結城","population":"31700","date_mod":"2006-10-12"}'
data["t0834"] = '{"name":"土浦","population":"22500","date_mod":"2006-7-22"}'
data["t0835"] = '{"name":"牛久","population":"93400","date_mod":"2006-8-24"}'
data["t0836"] = '{"name":"取手","population":"57800","date_mod":"2006-9-25"}'
data["t0837"] = '{"name":"つくば","population":"74600","date_mod":"2006-11-7"}'
data["t0838"] = '{"name":"日立","population":"25500","date_mod":"2006-10-21"}'
data["t0839"] = '{"name":"守谷","population":"91600","date_mod":"2006-3-2"}'
#
data.each do |key, value|
	bdb.put(key,value)
	end
#
end
# -----------------------------------------------------------------

# -------------------------------------------------------------
#
puts "Content-type: text/html\n\n"
#
bdb = BDB::new

# open the database
if !bdb.open("/var/tmp/tokyo_cabinet/cities.tcb", BDB::OWRITER | BDB::OCREAT)
	ecode = tdb.ecode
	STDERR.printf("open error: %s\n", tdb.errmsg(ecode))
end
#
data_create_proc (bdb)
#
# close the database
if !bdb.close
	ecode = bdb.ecode
	STDERR.printf("close error: %s\n", bdb.errmsg(ecode))
end
#
#
puts	"*** OK ***<br />"
#
# -------------------------------------------------------------
