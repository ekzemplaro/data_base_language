#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	postgre_create.js
//
//						Jul/16/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");


var url = "jdbc:postgresql://localhost/city";
var user = "scott";
var passwd = "tiger";

var conn = DriverManager.getConnection (url,user,passwd);

drop_table_proc (conn);
create_table_proc (conn);
insert_data_proc (conn);


conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
function insert_data_proc (conn)
{
	insert_record_proc (conn,"t3461","広島",39241,"1951-9-21");
	insert_record_proc (conn,"t3462","福山",42657,"1951-3-14");
	insert_record_proc (conn,"t3463","東広島", 51825,"1951-5-27");
	insert_record_proc (conn,"t3464","呉",27168,"1951-9-29");
	insert_record_proc (conn,"t3465","尾道",15937,"1951-10-16");
	insert_record_proc (conn,"t3466","竹原",19784,"1951-11-24");
	insert_record_proc (conn,"t3467","三次",18975,"1951-12-30");
	insert_record_proc (conn,"t3468","大竹",48457,"1951-11-18");
	insert_record_proc (conn,"t3469","府中",71639,"1951-4-21");

}
// ------------------------------------------------------------------
