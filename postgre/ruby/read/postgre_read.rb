#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_read.rb
#
#						May/14/2019
#
require 'pg'
require 'dotenv'
#
# --------------------------------------------------------------------
puts "*** 開始 ***"
#
Dotenv.load
user = ENV['user']
password = ENV['password']
data_base = ENV['data_base']
#
connection = PG::connect(:host => "localhost",
	:user =>user, :password =>password, :dbname =>data_base)
#
table = connection.exec('select * from cities order by ID')
#
table.each {|row|
	print(row["id"] + "\t")
	print(row["name"] + "\t")
	print(row["population"] + "\t")
	print(row["date_mod"] + "\n")
	}
#
connection.finish
#
puts "*** 終了 ***"
# --------------------------------------------------------------------
