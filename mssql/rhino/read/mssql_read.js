#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ------------------------------------------------------------------
//
//	mssql_read.js
//
//						Dec/23/2015
//
// ------------------------------------------------------------------
importPackage(java.lang)
importPackage(java.sql)

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js")

print	("*** 開始 ***")

var url = "jdbc:sqlserver://host_mssql\\EG;"
url += "databaseName=city";

var user = "sa"
var passwd = "Tiger123"

var conn = DriverManager.getConnection( url, user, passwd )

try	{
	disp_proc (conn)
	}
catch(ee)
	{
	print ("*** error ***")
	print (ee)
	}

conn.close()

print	("*** 終了 ***")
// ------------------------------------------------------------------
