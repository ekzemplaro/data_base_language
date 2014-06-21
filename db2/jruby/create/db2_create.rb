#! /usr/bin/jruby
# -*- encoding: utf-8 -*-
#
#	db2_read.rb
#
#					Jun/09/2011
#
#
# ---------------------------------------------------------------------
include Java
import java.sql.DriverManager
import java.lang.System
#
load '/var/www/data_base/common/jruby_common/jruby_sql_manipulate.rb'
# ---------------------------------------------------------------------
def insert_data_proc (conn)
	sql_insert_record_proc(conn,"t2871","神戸",71357,"2007-7-21");
	sql_insert_record_proc(conn,"t2872","姫路",34241,"2007-6-14");
	sql_insert_record_proc(conn,"t2873","尼崎",56592,"2007-5-27");
	sql_insert_record_proc(conn,"t2874","西宮",27386,"2007-9-29");
	sql_insert_record_proc(conn,"t2875","洲本",16437,"2007-10-16");
	sql_insert_record_proc(conn,"t2876","明石",49764,"2007-11-24");
	sql_insert_record_proc(conn,"t2877","芦屋",58298,"2007-12-30");
	sql_insert_record_proc(conn,"t2878","伊丹",46854,"2007-11-18");
	sql_insert_record_proc(conn,"t2879","豊岡",51947,"2007-7-21");
	sql_insert_record_proc(conn,"t2880","宝塚",47286,"2007-9-12");
end
# ---------------------------------------------------------------------
puts	"*** 開始 ***"

Java::JavaClass.for_name("COM.ibm.db2.jdbc.app.DB2Driver")

url = "jdbc:db2:cities";

user = "scott";
pass = "tiger";

conn = DriverManager.getConnection(url,user,pass);


sql_drop_table_proc(conn);
sql_create_table_proc(conn);
insert_data_proc(conn);

sql_read_proc(conn);

conn.close();

puts "*** 終了 ***";

# ---------------------------------------------------------------------
