#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	sqlite3_create.js
//
//						May/26/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var database = arguments[0];

Class.forName ("org.sqlite.JDBC");

var user = "";
var passwd = "";

var url = "jdbc:sqlite:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t0711","郡山",41659,"1951-3-12");
	insert_record_proc (conn,"t0712","会津若松",34348,"1951-6-24");
	insert_record_proc (conn,"t0713","白河", 58259,"1951-5-7");
	insert_record_proc (conn,"t0714","福島",27284,"1951-9-29");
	insert_record_proc (conn,"t0715","喜多方",14137,"1951-2-16");
	insert_record_proc (conn,"t0716","二本松",19734,"1951-11-24");
	insert_record_proc (conn,"t0717","いわき",82195,"1951-12-30");
	insert_record_proc (conn,"t0718","相馬",46584,"1951-10-12");
	insert_record_proc (conn,"t0719","須賀川",54971,"1951-9-25");

}
// ------------------------------------------------------------------
