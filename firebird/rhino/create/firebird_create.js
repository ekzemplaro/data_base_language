#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	firebird_create.js
//
//						Jul/05/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

Class.forName ("org.firebirdsql.jdbc.FBDriver");

var user = "sysdba";
var passwd = "tiger";
var database = "/var/tmp/firebird/cities.fdb";

var url = "jdbc:firebirdsql:localhost:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);



conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t3821","松山",58423,"1951-2-21");
	insert_record_proc (conn,"t3822","今治",24176,"1951-5-14");
	insert_record_proc (conn,"t3823","宇和島", 45297,"1951-5-27");
	insert_record_proc (conn,"t3824","八幡浜",25421,"1951-9-29");
	insert_record_proc (conn,"t3825","新居浜",15374,"1951-10-16");
	insert_record_proc (conn,"t3826","西条",98463,"1951-11-24");
	insert_record_proc (conn,"t3827","大洲",18392,"1951-12-30");
	insert_record_proc (conn,"t3828","伊予",49321,"1951-11-18");
	insert_record_proc (conn,"t3829","西予",56478,"1951-7-12");

}
// ------------------------------------------------------------------
