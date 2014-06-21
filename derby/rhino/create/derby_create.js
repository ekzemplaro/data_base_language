#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	derby_create.js
//
//						Oct/01/2012
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

var url = "jdbc:derby://localhost:1527/city_aaa;create=true";

var conn = DriverManager.getConnection (url);

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t3551","山口",41567,"1951-2-15");
	insert_record_proc (conn,"t3552","下関",34723,"1951-6-24");
	insert_record_proc (conn,"t3553","萩", 65428,"1951-5-27");
	insert_record_proc (conn,"t3554","徳山",27254,"1951-9-29");
	insert_record_proc (conn,"t3555","岩国",19637,"1951-3-16");
	insert_record_proc (conn,"t3556","光",75236,"1951-11-24");
	insert_record_proc (conn,"t3557","長門",49218,"1951-4-3");
	insert_record_proc (conn,"t3558","防府",46281,"1951-12-18");
	insert_record_proc (conn,"t3559","宇部",72546,"1951-3-9");
}

// ------------------------------------------------------------------
