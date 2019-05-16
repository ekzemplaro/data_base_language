#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	postgre_update.rb
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
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
date_mod=Date.today
sql_str="UPDATE cities SET population='#{population_in}', DATE_MOD='#{date_mod}' where ID = '#{id_in}'"
puts sql_str
connection.exec(sql_str)
#
connection.finish
#
puts "*** 終了 ***"
# ------------------------------------------------------------
