#! /usr/bin/java org.mozilla.javascript.tools.shell.Main
// -------------------------------------------------------------- 
//
//	update/cassandra_update.js
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
var population=arguments[1];

print ("\tkey = " + key);
print ("\tpopulation = " + population);

var str_connect = "jdbc:cassandra://localhost:9160/city";
var conn = DriverManager.getConnection (str_connect);
    
cassandra_update_proc (conn,key,population);

print ("*** 終了 ***");
// -------------------------------------------------------------- 
