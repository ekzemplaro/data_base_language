#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	tcbn_read.rb
#					Jul/23/2011
#
# --------------------------------------------------------
include Java
# import tokyocabinet.BDB
#import tokyocabinet
import	java.util.List


# --------------------------------------------------------
puts "*** 開始 ***"

bdb = tokyocabinet.BDB.new()

file_in = "/var/tmp/tokyo_cabinet/cities.tcb"

if !bdb.open(file_in, BDB.OWRITER | BDB.OCREAT)
	ecode = bdb.ecode()
	puts "open error: "
end

ff = tcbn_manipulate.new()
ff.tcbn_to_dict_proc(bdb)
dict_aa = ff.tcbn_to_dict_proc(bdb)
gg = text_manipulate.new()
gg.dict_display_proc(dict_aa)

	if !bdb.close()
		ecode = bdb.ecode()
		puts "close error: "
	end

puts "*** 終了 ***"

# --------------------------------------------------------
