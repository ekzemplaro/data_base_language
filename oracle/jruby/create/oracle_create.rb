#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	oracle_create.rb
#
#					Aug/06/2015
# ---------------------------------------------------------------------
include Java
import java.sql.DriverManager
import java.lang.System
import java.util.Locale

import java.util.Date
import java.text.DateFormat
import java.text.SimpleDateFormat
#
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,"t0131","函館",41968,"2007-7-14")
dict_aa=dict_append_proc(dict_aa,"t0132","札幌",27275,"2007-2-27")
dict_aa=dict_append_proc(dict_aa,"t0133","帯広",32824,"2007-11-8")
dict_aa=dict_append_proc(dict_aa,"t0134","釧路",25614,"2007-1-15")
dict_aa=dict_append_proc(dict_aa,"t0135","旭川",84148,"2007-5-21")
dict_aa=dict_append_proc(dict_aa,"t0136","北見",21581,"2007-4-7")
dict_aa=dict_append_proc(dict_aa,"t0137","室蘭",42692,"2007-4-8")
dict_aa=dict_append_proc(dict_aa,"t0138","根室",54125,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t0139","稚内",72152,"2007-6-9")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
host = "host_oracle"
user = "scott"
password = "tiger"

str_connect = "jdbc:oracl:thin:@" + host + ":1521/xe"

Java::JavaClass.for_name("oracle.jdbc.driver.OracleDriver")

conn = DriverManager.getConnection(str_connect,user,password)
#
dict_aa=prepare_data_proc()
#
sql_drop_table_proc(conn)
sql_create_table_proc(conn)
#
dict_aa.each {|key,value|
#	puts "key=",key

	str_date = value['date_mod']
	sdf = java.text.SimpleDateFormat("yyyy-MM-dd")
	date_aa = sdf.parse (str_date)
#	date_aa = SimpleDateFormat("yyyy-MM-dd").parse (str_date)
	str_ee = SimpleDateFormat(DATE_PATTERN,Locale.ENGLISH).format(date_aa).new
	
	sql_insert_record_proc(conn,key,value['name'], \
		value['population'],str_ee)
	}
#
sql_read_proc(conn)
#
conn.close()
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
