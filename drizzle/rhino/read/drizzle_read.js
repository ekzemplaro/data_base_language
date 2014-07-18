#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	drizzle_read.js
//
//						Jul/15/2014
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

var url = "jdbc:drizzle://localhost:4427/city";
var user = "scott";
var passwd = "tiger";

var conn = DriverManager.getConnection( url, user, passwd );

disp_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
