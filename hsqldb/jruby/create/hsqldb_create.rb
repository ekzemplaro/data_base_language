#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	hsqldb_create.rb
#
#					Jan/29/2015
# ---------------------------------------------------------------------
include Java
import java.sql.DriverManager
import java.lang.System
#
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
	dict_aa={}
	dict_aa=dict_append_proc(dict_aa,"t4671","鹿児島",76132,"2007-9-24");
	dict_aa=dict_append_proc(dict_aa,"t4672","指宿",94258,"2007-8-12");
	dict_aa=dict_append_proc(dict_aa,"t4673","志布志",31658,"2007-5-11");
	dict_aa=dict_append_proc(dict_aa,"t4674","川内",57234,"2007-9-25");
	dict_aa=dict_append_proc(dict_aa,"t4675","鹿屋",12976,"2007-10-16");
	dict_aa=dict_append_proc(dict_aa,"t4676","枕崎",31547,"2007-11-2");
	dict_aa=dict_append_proc(dict_aa,"t4677","出水",69831,"2007-2-6");
	dict_aa=dict_append_proc(dict_aa,"t4678","阿久根",89432,"2007-5-29");
	dict_aa=dict_append_proc(dict_aa,"t4679","霧島",52816,"2007-10-17");

	return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
#
str_connect = "jdbc:hsqldb:file:/var/tmp/hsqldb/cities;shutdown=true"
conn = DriverManager.getConnection(str_connect,"SA", "")
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
puts	"*** 終了 ***"
#
# ---------------------------------------------------------------------
