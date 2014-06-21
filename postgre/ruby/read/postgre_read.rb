#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_read.rb
#
#						May/10/2013
#
require 'dbi'
#
# --------------------------------------------------------------------
puts "*** 開始 ***"
#
dbi=DBI.connect("dbi:Pg:city:localhost","scott","tiger")
#
table = dbi.select_all('select * from cities order by ID')
#
table.each_with_index {|row,idx|
	print "#{row[0]}\t#{row[1]}\t#{row[2]}\t#{row[3]}\n"}
#
dbi.disconnect
#
puts "*** 終了 ***"
# --------------------------------------------------------------------
