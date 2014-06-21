#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	firebird_read.js
//
//						Nov/11/2010
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

Class.forName ("org.firebirdsql.jdbc.FBDriver");

var user = "sysdba";
var passwd = "tiger";
var database = "/var/tmp/firebird/cities.fdb";

var url = "jdbc:firebirdsql:localhost:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

disp_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
