#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	h2_delete.js
//
//						Jan/25/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];

print	(id_in);

var user = "SA";
var passwd = "";
var database = "file:/var/tmp/h2/cities";

var url = "jdbc:h2:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

delete_proc (conn,id_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
