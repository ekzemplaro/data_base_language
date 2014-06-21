#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	hsqldb_update.js
//
//						Dec/03/2010
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);
load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

print	(id_in + "\t" + population_in);

Class.forName ("org.hsqldb.jdbcDriver");

var user = "SA";
var passwd = "";
var database = "file:/var/tmp/hsqldb/cities;shutdown=true";

var url = "jdbc:hsqldb:" + database;

var conn = DriverManager.getConnection (url,user,passwd);

update_proc (conn,id_in,population_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
