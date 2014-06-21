#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	derby_read.js
//
//						Oct/01/2012
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

var url = "jdbc:derby://localhost:1527/city_aaa;create=true";

var conn = DriverManager.getConnection (url);

disp_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
