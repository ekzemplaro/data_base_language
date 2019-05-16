#! /usr/bin/ruby
#
#	version_check.rb
#
#					May/14/2019
# --------------------------------------------------------------------
require 'pg'
require 'dotenv'
#
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
row = connection.exec("SELECT VERSION()")
#
puts("Server version: " + row[0].to_s)
#
connection.finish
#
puts "*** 終了 ***"
#
# --------------------------------------------------------------------
