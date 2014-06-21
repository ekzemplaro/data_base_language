#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	sqlite3_update.js
//
//						Feb/09/2011
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var database = arguments[0];
var id_in=arguments[1];
var population_in=arguments[2];

Class.forName ("org.sqlite.JDBC");

var user = "";
var passwd = "";

var url = "jdbc:sqlite:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

update_proc (conn,id_in,population_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
