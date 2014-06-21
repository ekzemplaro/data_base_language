#! /usr/bin/jruby
# -*- coding: utf-8 -*-
#
#	cassandra_create.rb
#
#					Sep/06/2013
#
# ---------------------------------------------------------------------
include	Java
import	java.util.HashMap

import	java.sql.Connection
import	java.sql.DriverManager


load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/cassandra_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
	dict_aa = {}
	dict_aa=dict_append_proc(dict_aa,"t0531","秋田",75126,"2007-10-12")
	dict_aa=dict_append_proc(dict_aa,"t0532","男鹿",19342,"2007-9-21")
	dict_aa=dict_append_proc(dict_aa,"t0533","由利本荘",51876,"2007-7-15")
	dict_aa=dict_append_proc(dict_aa,"t0534","横手",27935,"2007-1-21")
	dict_aa=dict_append_proc(dict_aa,"t0535","鹿角",84197,"2007-5-24")
	dict_aa=dict_append_proc(dict_aa,"t0536","大館",21584,"2007-4-7")
	dict_aa=dict_append_proc(dict_aa,"t0537","能代",42693,"2007-4-8")
	dict_aa=dict_append_proc(dict_aa,"t0538","にかほ",54197,"2007-8-15")
	dict_aa=dict_append_proc(dict_aa,"t0539","湯沢",74523,"2007-10-27")
#
	return	dict_aa
end
# ---------------------------------------------------------------------
puts "*** 開始 ***"

str_connect = "jdbc:cassandra://localhost:9160/city"
conn = DriverManager.getConnection (str_connect)

dict_aa = prepare_data_proc()

dict_to_cassandra_proc(dict_aa,conn)

conn.close()

puts "*** 終了 ***"

# ---------------------------------------------------------------------
