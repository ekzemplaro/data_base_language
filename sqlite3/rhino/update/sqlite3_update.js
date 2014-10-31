#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	sqlite3_update.js
//
//						Oct/22/2014
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var database = arguments[0];
var key_in=arguments[1];
var population_in=arguments[2];

print	(key_in,population_in);

Class.forName ("org.sqlite.JDBC");

var user = "";
var passwd = "";

var url = "jdbc:sqlite:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

update_proc (conn,key_in,population_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
