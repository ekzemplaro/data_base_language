#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	firebird_update.js
//
//						Aug/25/2015
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

Class.forName ("org.firebirdsql.jdbc.FBDriver");

var user = "sysdba";
var passwd = "tiger";
var database = "/var/tmp/firebird/cities.fdb";

var url = "jdbc:firebirdsql:host_firebird:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

update_proc (conn,id_in,population_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
