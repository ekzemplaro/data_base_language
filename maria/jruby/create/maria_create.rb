#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	maria_create.rb
#
#					May/23/2014
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
dict_aa=dict_append_proc(dict_aa,"t3321","岡山",271968,"2007-8-14")
dict_aa=dict_append_proc(dict_aa,"t3322","倉敷",941275,"2007-9-27")
dict_aa=dict_append_proc(dict_aa,"t3323","津山",637824,"2007-11-8")
dict_aa=dict_append_proc(dict_aa,"t3324","玉野",256148,"2007-1-15")
dict_aa=dict_append_proc(dict_aa,"t3325","笠岡",871493,"2007-5-21")
dict_aa=dict_append_proc(dict_aa,"t3326","井原",295831,"2007-10-7")
dict_aa=dict_append_proc(dict_aa,"t3327","総社",416927,"2007-4-8")
dict_aa=dict_append_proc(dict_aa,"t3328","高梁",541263,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t3329","新見",912457,"2007-6-9")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:mysql://localhost/city"
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
