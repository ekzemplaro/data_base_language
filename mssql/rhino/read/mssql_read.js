#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	mssql_read.js
//
//						Jan/17/2013
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

// var url = "jdbc:sqlserver://host_mssql\\SQLEXPRESS;";
var url = "jdbc:sqlserver://host_mssql;";
	url += "databaseName=city;";

var user = "sa";
var passwd = "scott_tiger";

var conn = DriverManager.getConnection( url, user, passwd );

disp_proc (conn);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
