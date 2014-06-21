#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	mssql_delete.js
//
//						Jan/17/2013
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];

print	("id_in = " + id_in);

var url = "jdbc:sqlserver://host_mssql;";
	url += "databaseName=city;";

var user = "sa";
var passwd = "scott_tiger";

var conn = DriverManager.getConnection( url, user, passwd );

delete_proc (conn,id_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
