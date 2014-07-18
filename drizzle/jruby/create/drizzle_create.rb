#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	drizzle_create.rb
#
#					Jul/16/2014
# ---------------------------------------------------------------------
include Java
import java.sql.DriverManager
import java.lang.System
#
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,"t2651","京都",31968,"2007-5-25")
dict_aa=dict_append_proc(dict_aa,"t2652","福知山",93275,"2007-8-12")
dict_aa=dict_append_proc(dict_aa,"t2653","舞鶴",39124,"2007-10-8")
dict_aa=dict_append_proc(dict_aa,"t2654","綾部",25714,"2007-1-15")
dict_aa=dict_append_proc(dict_aa,"t2655","宇治",57248,"2007-5-21")
dict_aa=dict_append_proc(dict_aa,"t2656","宮津",24581,"2007-3-7")
dict_aa=dict_append_proc(dict_aa,"t2657","亀岡",42193,"2007-4-8")
dict_aa=dict_append_proc(dict_aa,"t2658","城陽",54127,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,"t2659","向日",14852,"2007-6-9")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:drizzle://localhost:4427/city"
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
