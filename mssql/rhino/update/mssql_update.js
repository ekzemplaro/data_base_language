#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	mssql_update.js
//
//						Nov/06/2015
//
// ------------------------------------------------------------------
importPackage(java.lang);
importPackage(java.sql);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");

print	("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

print	("id_in = " + id_in + "\tpopulation_in = " + population_in);

var url = "jdbc:sqlserver://host_mssql\\EG;";
	url += "databaseName=city;";

var user = "sa";
// var passwd = "scott_tiger";
var passwd = "Tiger123";

var conn = DriverManager.getConnection( url, user, passwd );

update_proc (conn,id_in,population_in);

conn.close();

print	("*** 終了 ***");
// ------------------------------------------------------------------
