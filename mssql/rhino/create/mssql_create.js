#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	mssql_create.js
//
//					Jan/17/2013
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");


print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

var url = "jdbc:sqlserver://host_mssql\\EG;";
	url += "databaseName=city;";

var user = "sa";
// var passwd = "scott_tiger";
var passwd = "Tiger123";

var conn = DriverManager.getConnection( url, user, passwd );

drop_table_proc (conn);
mssql_create_table_proc (conn);
insert_data_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function mssql_create_table_proc (conn)
{
	var stmt = conn.createStatement();

	var sql_str = "create table cities (id varchar(10), ";
	sql_str += "name nvarchar(20),population int,date_mod datetime)";

	stmt.execute (sql_str);

	stmt.close ();
}

// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t1071","前橋",68571,"1951-9-23");
	insert_record_proc (conn,"t1072","高崎",82437,"1951-1-16");
	insert_record_proc (conn,"t1073","桐生",51294,"1951-2-12");
	insert_record_proc (conn,"t1074","沼田",27381,"1951-8-16");
	insert_record_proc (conn,"t1075","伊勢崎",12519,"1951-10-14");
	insert_record_proc (conn,"t1076","水上",81274,"1951-11-21");
	insert_record_proc (conn,"t1077","太田",59183,"1951-12-16");
	insert_record_proc (conn,"t1078","安中",67142,"1951-5-8");
	insert_record_proc (conn,"t1079","みどり",51927,"1951-3-21");

}
// ------------------------------------------------------------------
