#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	mssql_delete.js
//
//						Nov/06/2015
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

var key_in=arguments[0];

print	("key_in = " + key_in);

var url = "jdbc:sqlserver://host_mssql\\EG;";
	url += "databaseName=city;";

var user = "sa";
// var passwd = "scott_tiger";
var passwd = "Tiger123";

var conn = DriverManager.getConnection (url,user,passwd);

delete_proc (conn,key_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
