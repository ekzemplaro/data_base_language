#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	mysql_delete.js
//
//						Jan/25/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];

var url = "jdbc:mysql://host_mysql/city";
var user = "scott";
var passwd = "tiger";

var conn = DriverManager.getConnection( url, user, passwd );

delete_proc (conn,id_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
