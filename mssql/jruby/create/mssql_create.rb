#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	mssql_create.rb
#
#					Jan/17/2013
# ---------------------------------------------------------------------
include Java
import com.microsoft.sqlserver.jdbc.SQLServerDriver
import java.sql.DriverManager
import java.lang.System
#
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
	dict_aa=dict_append_proc(dict_aa,"t1071","前橋",23516,"2007-4-21")
	dict_aa=dict_append_proc(dict_aa,"t1072","高崎",57394,"2007-8-7")
	dict_aa=dict_append_proc(dict_aa,"t1073","桐生",84178,"2007-5-12")
	dict_aa=dict_append_proc(dict_aa,"t1074","沼田",91843,"2007-9-18")
	dict_aa=dict_append_proc(dict_aa,"t1075","伊勢崎",36219,"2007-10-14")
	dict_aa=dict_append_proc(dict_aa,"t1076","水上",25874,"2007-11-21")
	dict_aa=dict_append_proc(dict_aa,"t1077","太田",89153,"2007-12-16")
	dict_aa=dict_append_proc(dict_aa,"t1078","安中",42731,"2007-5-8")
	dict_aa=dict_append_proc(dict_aa,"t1079","みどり",51463,"2007-7-21")

	return dict_aa
end

# ---------------------------------------------------------------------
def mssql_create_table_proc (conn)
	sql_str = "create table cities (id varchar(10), name nvarchar(20), population int, date_mod datetime)"

	st = conn.prepareStatement(sql_str)
	result = st.executeUpdate()
end

# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:sqlserver://host_mssql;databaseName=city;"
#
conn = DriverManager.getConnection(str_connect,"sa","scott_tiger")
#
dict_aa=prepare_data_proc()
#
sql_drop_table_proc(conn)
mssql_create_table_proc(conn)
#
dict_aa.each {|key,value|
#	puts key
	sql_insert_record_proc(conn,key,value['name'], \
		value['population'],value['date_mod'])
	}
#
sql_read_proc(conn)
conn.close()
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
