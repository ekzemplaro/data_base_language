#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	oracle_create.js
//
//						Aug/05/2015
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

// ------------------------------------------------------------------
print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

var host = "host_oracle";

var url = "jdbc:oracl:thin:@" + host + ":1521/xe"
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
	insert_record_proc (conn,"t0131","函館",71578,"2-MAY-1951");
	insert_record_proc (conn,"t0132","札幌",82431,"14-JUN-1951");
	insert_record_proc (conn,"t0133","帯広",52749,"7-JUL-1951");
	insert_record_proc (conn,"t0134","釧路",35291,"12-SEP-1951");
	insert_record_proc (conn,"t0135","旭川",71268,"19-AUG-1951");
	insert_record_proc (conn,"t0136","北見",26759,"21-JAN-1951");
	insert_record_proc (conn,"t0137","室蘭",95182,"24-FEB-1951");
	insert_record_proc (conn,"t0138","根室",13274,"22-OCT-1951");
	insert_record_proc (conn,"t0139","稚内",67536,"27-MAR-1951");

}
// ------------------------------------------------------------------
