#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// -------------------------------------------------------------- 
//
//	cassandra_delete.js
//
//					Sep/05/2013
//
// -------------------------------------------------------------- 
importPackage (java.lang);

importPackage (java.sql);

load ("/var/www/data_base/common/rhino_common/text_manipulate.js");
load ("/var/www/data_base/common/rhino_common/cassandra_manipulate.js");
// -------------------------------------------------------------- 
print ("*** 開始 ***");

var key=arguments[0];

print ("\tkey = " + key);

var str_connect = "jdbc:cassandra://localhost:9160/city";
var conn = DriverManager.getConnection (str_connect);
    
cassandra_delete_proc (conn,key);

print ("*** 終了 ***");
// -------------------------------------------------------------- 
