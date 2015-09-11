#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	oracle_read.js
//
//						Aug/05/2015
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
// ------------------------------------------------------------------

print	("*** 開始 ***");

var host = "host_oracle";

var url = "jdbc:oracl:thin:@" + host + ":1521/xe";
var user = "scott";
var passwd = "tiger";

var conn = DriverManager.getConnection (url,user,passwd);

disp_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
