#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	maria_read.rb
#
#					Apr/07/2017
#
# ------------------------------------------------------------------
require 'mysql'
#
# ------------------------------------------------------------------
puts "*** 開始 ***"
#
host = "127.0.0.1"
user = "scott"
password = "tiger123"
data_base = 'city'
connection = Mysql::new(host, user,password,data_base)

sql_str = "SELECT id,name,population,date_mod FROM cities order by ID"
begin
	result = connection.query(sql_str)
	result.each do |row|
		print "#{row[0]}\t#{row[1]}\t#{row[2]}\t#{row[3]}\n"
	end
end
#
connection.close
#
puts "*** 終了 ***"
# ------------------------------------------------------------------
