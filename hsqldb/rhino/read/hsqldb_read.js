#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	hsqldb_read.js
//
//						Dec/03/2010
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

Class.forName ("org.hsqldb.jdbcDriver");

var user = "SA";
var passwd = "";
var database = "file:/var/tmp/hsqldb/cities;shutdown=true";

var url = "jdbc:hsqldb:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

disp_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
