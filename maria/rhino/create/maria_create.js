#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	maria_create.js
//
//						May/21/2014
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];


var url = "jdbc:mysql://localhost/city";
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
	insert_record_proc (conn,"t3321","岡山",417253,"1951-8-1");
	insert_record_proc (conn,"t3322","倉敷",382941,"1951-1-14");
	insert_record_proc (conn,"t3323","津山", 581792,"1951-5-27");
	insert_record_proc (conn,"t3324","玉野",246837,"1951-9-29");
	insert_record_proc (conn,"t3325","笠岡",128975,"1951-10-16");
	insert_record_proc (conn,"t3326","井原",497234,"1951-11-24");
	insert_record_proc (conn,"t3327","総社",582917,"1951-12-30");
	insert_record_proc (conn,"t3328","高梁",452189,"1951-11-18");
	insert_record_proc (conn,"t3329","新見",596347,"1951-9-21");
}
// ------------------------------------------------------------------
