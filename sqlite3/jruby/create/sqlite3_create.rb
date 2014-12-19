#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	create/sqlite3_create.rb
#
#					Dec/15/2014
#
include Java
import org.sqlite.JDBC
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/ruby_common/text_manipulate.rb'
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
def prepare_data_proc ()
dict_aa={}
dict_aa=dict_append_proc(dict_aa,'t0711',"郡山",96321,"2007-8-17")
dict_aa=dict_append_proc(dict_aa,'t0712',"会津若松",29587,"2007-4-27")
dict_aa=dict_append_proc(dict_aa,'t0713',"白河",71824,"2007-5-8")
dict_aa=dict_append_proc(dict_aa,'t0714',"福島",25148,"2007-1-15")
dict_aa=dict_append_proc(dict_aa,'t0715',"喜多方",84735,"2007-5-21")
dict_aa=dict_append_proc(dict_aa,'t0716',"二本松",29581,"2007-4-7")
dict_aa=dict_append_proc(dict_aa,'t0717',"いわき",41692,"2007-4-8")
dict_aa=dict_append_proc(dict_aa,'t0718',"相馬",54128,"2007-8-15")
dict_aa=dict_append_proc(dict_aa,'t0719',"須賀川",93425,"2007-10-11")
return dict_aa
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"
file_sqlite3 = ARGV[0]

str_connect = "jdbc:sqlite:" + file_sqlite3
#
conn = DriverManager.getConnection(str_connect,"", "")
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
