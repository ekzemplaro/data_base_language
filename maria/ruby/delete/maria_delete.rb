#! /usr/bin/ruby
# -*- coding: utf-8 -*-
#
#	maria_delete.rb
#
#				Feb/03/2017
#
require 'mysql'
#
# ------------------------------------------------------------
def	delete_proc (connection,id)
	sql_str="DELETE from cities where ID = '#{id}'"
	connection.query(sql_str)
end
# ------------------------------------------------------------
puts "*** 開始 ***"
#
id_in = ARGV[0]
#
puts id_in
#
host = "127.0.0.1"
user = "scott"
password = "tiger"
data_base = 'city'
connection = Mysql::new(host, user,password,data_base)
#
delete_proc(connection,id_in)
#
connection.commit
connection.close
#
puts "*** 終了 ***"
# ------------------------------------------------------------
