#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	h2_create.js
//
//					Nov/22/2013
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");


var user = "SA";
var passwd = "";
var database = "file:/var/tmp/h2/cities";

var url = "jdbc:h2:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t4561","宮崎",71258,"1951-5-27");
	insert_record_proc (conn,"t4562","日南",37241,"1951-7-15");
	insert_record_proc (conn,"t4563","延岡",61725,"1951-5-21");
	insert_record_proc (conn,"t4564","都城",52435,"1951-8-23");
	insert_record_proc (conn,"t4565","小林",19732,"1951-10-12");
	insert_record_proc (conn,"t4566","日向",43517,"1951-5-7");
	insert_record_proc (conn,"t4567","串間",57324,"1951-6-24");
	insert_record_proc (conn,"t4568","西都",82173,"1951-9-14");
	insert_record_proc (conn,"t4569","えびの",51836,"1951-4-19");
}


// ------------------------------------------------------------------
