#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	maria_update.rb
#
#					Apr/07/2017
#
require 'mysql'
require 'date'
#
# ------------------------------------------------------------
def	update_proc (connection,id,population)
	date_mod=Date.today
	sql_str="UPDATE cities SET population='#{population}', DATE_MOD='#{date_mod}' where ID = '#{id}'"
	connection.query(sql_str)
end
# ------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
population_in = ARGV[1].to_i
#
puts id_in,population_in
#
host = "127.0.0.1"
user = "scott"
password = "tiger123"
data_base = 'city'
connection = Mysql::new(host, user,password,data_base)
#
update_proc(connection,id_in,population_in)
#
connection.commit
connection.close
#
puts "*** 終了 ***"
# ------------------------------------------------------------
