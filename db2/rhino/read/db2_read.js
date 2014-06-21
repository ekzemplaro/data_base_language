#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ---------------------------------------------------------------------
/*
	db2_read.js

					Jun/02/2011
*/
// ---------------------------------------------------------------------
importPackage (java.sql);
importPackage (java.lang);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");

// ---------------------------------------------------------------------
print ("*** 開始 ***");

Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();

var url = "jdbc:db2:cities";

var user = "scott";
var pass = "tiger";

var conn = DriverManager.getConnection (url,user,pass);

disp_proc (conn);

conn.close ();

print ("*** 終了 ***");

// ---------------------------------------------------------------------
