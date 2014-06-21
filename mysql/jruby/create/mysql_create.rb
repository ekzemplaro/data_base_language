#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	mysql_create.rb
#
#					Jul/09/2011
# ---------------------------------------------------------------------
include Java
import org.gjt.mm.mysql.Driver
import java.sql.DriverManager
import java.lang.System
#
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,"t3321","岡山",71968,"2007-7-14")
dict_aa=dict_append_proc(dict_aa,"t3322","倉敷",47275,"2007-2-27")
dict_aa=dict_append_proc(dict_aa,"t3323","津山",32824,"2007-11-8")
dict_aa=dict_append_proc(dict_aa,"t3324","玉野",25614,"2007-1-15")
dict_aa=dict_append_proc(dict_aa,"t3325","笠岡",84148,"2007-5-21")
dict_aa=dict_append_proc(dict_aa,"t3326","井原",21581,"2007-4-7")
dict_aa=dict_append_proc(dict_aa,"t3327","総社",42692,"2007-4-8")
dict_aa=dict_append_proc(dict_aa,"t3328","高梁",54125,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t3329","新見",12152,"2007-6-9")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:mysql://host_mysql/city"
#
conn = DriverManager.getConnection(str_connect,"scott", "tiger")
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
sql_read_proc(conn)
#
conn.close()
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
