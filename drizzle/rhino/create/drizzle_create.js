#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	drizzle_create.js
//
//						Jul/15/2014
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];


var url = "jdbc:drizzle://localhost:4427/city";
var user = "scott";
var passwd = "tiger";

var conn = DriverManager.getConnection( url, user, passwd );

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);


conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t2651","京都",81353,"1951-8-12");
	insert_record_proc (conn,"t2652","福知山",39241,"1951-6-14");
	insert_record_proc (conn,"t2653","舞鶴", 71592,"1951-5-27");
	insert_record_proc (conn,"t2654","綾部",24387,"1951-9-29");
	insert_record_proc (conn,"t2655","宇治",12875,"1951-10-16");
	insert_record_proc (conn,"t2656","宮津",29134,"1951-11-24");
	insert_record_proc (conn,"t2657","亀岡",58297,"1951-12-30");
	insert_record_proc (conn,"t2658","城陽",45129,"1951-11-18");
	insert_record_proc (conn,"t2659","向日",59632,"1951-9-21");
}
// ------------------------------------------------------------------
