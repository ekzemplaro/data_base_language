#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	derby_create.rb
#
#					Oct/01/2012
# ---------------------------------------------------------------------
include Java
import org.apache.derby.jdbc.ClientDriver
import java.sql.DriverManager
import java.lang.System
#
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa={}

	dict_aa=dict_append_proc(dict_aa,"t3551","山口",75182,"2007-7-21")
	dict_aa=dict_append_proc(dict_aa,"t3552","下関",72465,"2007-6-17")
	dict_aa=dict_append_proc(dict_aa,"t3553","萩", 59513,"2007-5-27")
	dict_aa=dict_append_proc(dict_aa,"t3554","徳山",47187,"2007-9-21")
	dict_aa=dict_append_proc(dict_aa,"t3555","岩国",18436,"2007-10-16")
	dict_aa=dict_append_proc(dict_aa,"t3556","光",97245,"2007-11-24")
	dict_aa=dict_append_proc(dict_aa,"t3557","長門",68217,"2007-12-3")
	dict_aa=dict_append_proc(dict_aa,"t3558","防府",15282,"2007-11-18")
	dict_aa=dict_append_proc(dict_aa,"t3559","宇部",73549,"2007-10-23")

	return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:derby://localhost:1527/city_aaa;create=true"
conn = DriverManager.getConnection(str_connect)
#
dict_aa=data_prepare_proc()
#
sql_drop_table_proc(conn)
sql_create_table_proc(conn)
#
dict_aa.each {|key,value|
	sql_insert_record_proc(conn,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
sql_read_proc(conn)
#
conn.close()
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
