#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	h2_create.rb
#
#					Nov/22/2013
# ---------------------------------------------------------------------
include Java
import org.h2.Driver
import java.sql.DriverManager
import java.lang.System
#
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4561","宮崎",24897,"2007-9-17")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4562","日南",76251,"2007-1-25")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4563","延岡",39185,"2007-8-11")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4564","都城",21634,"2007-6-15")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4565","小林",19732,"2007-5-12")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4566","日向",49518,"2007-11-7")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4567","串間",57329,"2007-7-21")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4568","西都",82175,"2007-9-14")
dict_aa=dict_aa=dict_append_proc(dict_aa,"t4569","えびの",27931,"2007-4-19")

	return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:h2:file:/var/tmp/h2/cities"
conn = DriverManager.getConnection(str_connect,"SA", "")
#
dict_aa=prepare_data_proc()
#
sql_drop_table_proc(conn)
sql_create_table_proc(conn)
#
dict_aa.each {|key,value|
#	puts "key=",key
	sql_insert_record_proc(conn,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
#
sql_read_proc(conn)
#
conn.close()
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
