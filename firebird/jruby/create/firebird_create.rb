#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	firebird_create.rb
#
#					May/21/2012
# ---------------------------------------------------------------------
include Java
import org.firebirdsql.jdbc.FBDriver
import java.sql.DriverManager
import java.lang.System
#
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
def data_prepare_proc ()
	dict_aa={}

	dict_aa=dict_append_proc(dict_aa,"t3821","松山",91547,"2007-6-21")
	dict_aa=dict_append_proc(dict_aa,"t3822","今治",86251,"2007-7-14")
	dict_aa=dict_append_proc(dict_aa,"t3823","宇和島",37263,"2007-3-27")
	dict_aa=dict_append_proc(dict_aa,"t3824","八幡浜",24298,"2007-9-29")
	dict_aa=dict_append_proc(dict_aa,"t3825","新居浜",15371,"2007-10-16")
	dict_aa=dict_append_proc(dict_aa,"t3826","西条",19645,"2007-11-24")
	dict_aa=dict_append_proc(dict_aa,"t3827","大洲",18196,"2007-12-30")
	dict_aa=dict_append_proc(dict_aa,"t3828","伊予",47384,"2007-5-18")
	dict_aa=dict_append_proc(dict_aa,"t3829","西予",52847,"2007-7-21")

	return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:firebirdsql:localhost/3050:/var/tmp/firebird/cities.fdb"
#
conn = DriverManager.getConnection(str_connect,"sysdba", "tiger")
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
conn.close()
#
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
