#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// ----------------------------------------------------------------------
/*
	db2_update.js

				Jun/02/2011

*/
// ----------------------------------------------------------------------
importPackage (java.sql);
importPackage (java.lang);

load ("/var/www/data_base/common/rhino_common/sql_manipulate.js");
load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
// ----------------------------------------------------------------------
print ("*** 開始 ***");

var id_in=arguments[0];
var population_in=arguments[1];

print ("\tid_in = " + id_in);
print ("\tpopulation_in = " + population_in);

Class.forName("COM.ibm.db2.jdbc.app.DB2Driver").newInstance();

var url = "jdbc:db2:cities";

var user = "scott";
var pass = "tiger";

var conn = DriverManager.getConnection (url,user,pass);

update_proc	(conn,id_in,population_in);

disp_proc	(conn);

conn.close ();

print ("*** 終了 ***");

// ----------------------------------------------------------------------
