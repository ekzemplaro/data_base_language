#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	sqlite3_read.js
//
//						Sep/09/2010
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

var database = arguments[0];

Class.forName ("org.sqlite.JDBC");

var user = "";
var passwd = "";

var url = "jdbc:sqlite:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

disp_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
