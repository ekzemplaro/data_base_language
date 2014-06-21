#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	oracle_create.js
//
//						May/23/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

Class.forName ("oracle.jdbc.driver.OracleDriver");

var url = "jdbc:oracl:thin:@spn109:1521/xe";
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
	insert_record_proc (conn,"t0131","函館",71578,"1951-5-2");
	insert_record_proc (conn,"t0132","札幌",32431,"1951-6-14");
	insert_record_proc (conn,"t0133","帯広",52542,"1951-5-7");
	insert_record_proc (conn,"t0134","釧路",38281,"1951-9-12");
	insert_record_proc (conn,"t0135","旭川",71268,"1951-8-19");
	insert_record_proc (conn,"t0136","北見",26259,"1951-1-21");
	insert_record_proc (conn,"t0137","室蘭",95252,"1951-2-24");
	insert_record_proc (conn,"t0138","根室",14274,"1951-5-22");
	insert_record_proc (conn,"t0139","稚内",67536,"1951-3-27");

}
// ------------------------------------------------------------------
