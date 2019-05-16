#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_delete.rb
#
#				May/14/2019
#
require 'pg'
require 'dotenv'
#
# ------------------------------------------------------------
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
id_in = ARGV[0]
#
puts id_in
#
sql_str="DELETE from cities where ID = '#{id_in}'"
puts sql_str
connection.exec(sql_str)
#
#
connection.finish
#
puts "*** 終了 ***"
# ------------------------------------------------------------
