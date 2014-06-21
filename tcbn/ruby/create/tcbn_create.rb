#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	tcbn_create.rb
#
#					Mar/22/2013
# -----------------------------------------------------------------
require 'tokyocabinet'
include TokyoCabinet
#
load '/var/www/data_base/common/ruby_common/tcbn_manipulate.rb'
#
# -----------------------------------------------------------------
def data_create_proc (bdb)
	data = {}
data["t0831"] = '{"name":"水戸","population":"48251","date_mod":"2006-1-15"}'
data["t0832"] = '{"name":"古河","population":"75892","date_mod":"2006-2-24"}'
data["t0833"] = '{"name":"結城","population":"31724","date_mod":"2006-3-12"}'
data["t0834"] = '{"name":"土浦","population":"24531","date_mod":"2006-7-22"}'
data["t0835"] = '{"name":"牛久","population":"93467","date_mod":"2006-8-24"}'
data["t0836"] = '{"name":"取手","population":"57382","date_mod":"2006-9-21"}'
data["t0837"] = '{"name":"つくば","population":"74352","date_mod":"2006-10-17"}'
data["t0838"] = '{"name":"日立","population":"25739","date_mod":"2006-11-15"}'
data["t0839"] = '{"name":"守谷","population":"31265","date_mod":"2006-8-27"}'

data.each do |key, value|
	bdb.put(key,value)
	end
#
puts ("----------")
	data.each do |key,value|
		printf("%s:%s\n", key, value)
	end
puts ("----------")
end

# -----------------------------------------------------------------
puts	"*** 開始 ***"
# create the object
bdb = BDB::new

# open the database
if !bdb.open("/var/tmp/tokyo_cabinet/cities.tcb", BDB::OWRITER | BDB::OCREAT)
	ecode = bdb.ecode
	STDERR.printf("open error: %s\n", bdb.errmsg(ecode))
end

data_create_proc (bdb)
#
# close the database
if !bdb.close
	ecode = bdb.ecode
	STDERR.printf("close error: %s\n", bdb.errmsg(ecode))
end
#
puts	"*** 終了 ***"
# -----------------------------------------------------------------
