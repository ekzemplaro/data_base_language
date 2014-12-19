#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	create/postgre_create.rb
#
#					Dec/04/2014
# ---------------------------------------------------------------------
include Java
import org.postgresql.Driver
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
#
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,"t3461","広島",51967,"2007-3-12")
dict_aa=dict_append_proc(dict_aa,"t3462","福山",87465,"2007-4-27")
dict_aa=dict_append_proc(dict_aa,"t3463","東広島",59724,"2007-5-8")
dict_aa=dict_append_proc(dict_aa,"t3464","呉",25849,"2007-1-15")
dict_aa=dict_append_proc(dict_aa,"t3465","尾道",56421,"2007-5-21")
dict_aa=dict_append_proc(dict_aa,"t3466","竹原",21589,"2007-4-7")
dict_aa=dict_append_proc(dict_aa,"t3467","三次",42937,"2007-9-8")
dict_aa=dict_append_proc(dict_aa,"t3468","大竹",54728,"2007-10-15")
dict_aa=dict_append_proc(dict_aa,"t3469","府中",71269,"2007-3-21")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:postgresql://localhost/city"

conn = DriverManager.getConnection(str_connect,"scott", "tiger")

#
dict_aa=prepare_data_proc()
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
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
