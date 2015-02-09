#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	hsqldb_create.js
//
//						Jan/28/2015
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

Class.forName ("org.hsqldb.jdbcDriver");

var user = "SA";
var passwd = "";
var database = "file:/var/tmp/hsqldb/cities;shutdown=true";

var url = "jdbc:hsqldb:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);


conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t4671","鹿児島",52819,"1951-6-22");
	insert_record_proc (conn,"t4672","指宿",71548,"1951-5-16");
	insert_record_proc (conn,"t4673","志布志",61523,"1951-5-21");
	insert_record_proc (conn,"t4674","川内",27934,"1951-9-28");
	insert_record_proc (conn,"t4675","鹿屋",12837,"1951-10-6");
	insert_record_proc (conn,"t4676","枕崎",34516,"1951-11-21");
	insert_record_proc (conn,"t4677","出水",19832,"1951-2-6");
	insert_record_proc (conn,"t4678","阿久根",49732,"1951-5-29");
	insert_record_proc (conn,"t4679","霧島",59816,"1951-10-12");
}

// ------------------------------------------------------------------

// ------------------------------------------------------------------
